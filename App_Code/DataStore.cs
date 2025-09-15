using System;
using System.Data;

public static class DataStore
{
    private static readonly object _lock = new object();
    private static DataTable _donors;
    private static DataTable _acceptors;
    private static DataTable _requests;
    private static bool _initialized = false;

    static DataStore()
    {
        Initialize();
    }

    public static void Initialize()
    {
        if (_initialized) return;
        lock (_lock)
        {
            if (_initialized) return;

            _donors = new DataTable("Donors");
            _donors.Columns.Add("DonorId", typeof(int));
            _donors.Columns.Add("Name", typeof(string));
            _donors.Columns.Add("Age", typeof(int));
            _donors.Columns.Add("Gender", typeof(string));
            _donors.Columns.Add("BloodGroup", typeof(string));
            _donors.Columns.Add("ContactNumber", typeof(string));
            _donors.Columns.Add("Email", typeof(string));
            _donors.Columns.Add("Address", typeof(string));
            _donors.Columns.Add("CreatedAt", typeof(DateTime));
            _donors.PrimaryKey = new DataColumn[] { _donors.Columns["DonorId"] };

            _acceptors = new DataTable("Acceptors");
            _acceptors.Columns.Add("AcceptorId", typeof(int));
            _acceptors.Columns.Add("Name", typeof(string));
            _acceptors.Columns.Add("Age", typeof(int));
            _acceptors.Columns.Add("Gender", typeof(string));
            _acceptors.Columns.Add("BloodGroup", typeof(string));
            _acceptors.Columns.Add("ContactNumber", typeof(string));
            _acceptors.Columns.Add("Email", typeof(string));
            _acceptors.Columns.Add("HospitalName", typeof(string));
            _acceptors.Columns.Add("RequestReason", typeof(string));
            _acceptors.Columns.Add("CreatedAt", typeof(DateTime));
            _acceptors.PrimaryKey = new DataColumn[] { _acceptors.Columns["AcceptorId"] };

            _requests = new DataTable("Requests");
            _requests.Columns.Add("RequestId", typeof(int));
            _requests.Columns.Add("AcceptorId", typeof(int));
            _requests.Columns.Add("DonorId", typeof(int));
            _requests.Columns.Add("BloodGroup", typeof(string));
            _requests.Columns.Add("Units", typeof(int));
            _requests.Columns.Add("Urgency", typeof(string));
            _requests.Columns.Add("Status", typeof(string));
            _requests.Columns.Add("Notes", typeof(string));
            _requests.Columns.Add("CreatedAt", typeof(DateTime));
            _requests.PrimaryKey = new DataColumn[] { _requests.Columns["RequestId"] };

            _initialized = true;
        }
    }

    private static int NextId(DataTable table, string keyColumn)
    {
        int max = 0;
        foreach (DataRow row in table.Rows)
        {
            int id = Convert.ToInt32(row[keyColumn]);
            if (id > max) max = id;
        }
        return max + 1;
    }

    // Donors
    public static int AddDonor(string name, int age, string gender, string bg, string phone, string email, string address)
    {
        lock (_lock)
        {
            DataRow row = _donors.NewRow();
            row["DonorId"] = NextId(_donors, "DonorId");
            row["Name"] = name;
            row["Age"] = age;
            row["Gender"] = gender;
            row["BloodGroup"] = bg;
            row["ContactNumber"] = phone;
            row["Email"] = email;
            row["Address"] = address;
            row["CreatedAt"] = DateTime.Now;
            _donors.Rows.Add(row);
            return (int)row["DonorId"];
        }
    }

    public static DataTable GetDonors()
    {
        return _donors;
    }

    public static DataTable SearchDonorsByBloodGroup(string bg)
    {
        if (string.IsNullOrEmpty(bg)) return _donors;
        DataTable result = _donors.Clone();
        foreach (DataRow row in _donors.Rows)
        {
            if (row["BloodGroup"].ToString() == bg)
                result.ImportRow(row);
        }
        return result;
    }

    public static DataRow GetDonorByEmail(string email)
    {
        foreach (DataRow row in _donors.Rows)
        {
            if (string.Equals(row["Email"].ToString(), email, StringComparison.OrdinalIgnoreCase))
                return row;
        }
        return null;
    }

    public static void UpdateDonor(int id, string name, int age, string gender, string bg, string phone, string email, string address)
    {
        lock (_lock)
        {
            DataRow row = _donors.Rows.Find(id);
            if (row == null) return;
            row["Name"] = name;
            row["Age"] = age;
            row["Gender"] = gender;
            row["BloodGroup"] = bg;
            row["ContactNumber"] = phone;
            row["Email"] = email;
            row["Address"] = address;
        }
    }

    public static void DeleteDonor(int id)
    {
        lock (_lock)
        {
            DataRow row = _donors.Rows.Find(id);
            if (row != null) _donors.Rows.Remove(row);
        }
    }

    // Acceptors
    public static int AddAcceptor(string name, int age, string gender, string bg, string phone, string email, string hospital, string reason)
    {
        lock (_lock)
        {
            DataRow row = _acceptors.NewRow();
            row["AcceptorId"] = NextId(_acceptors, "AcceptorId");
            row["Name"] = name;
            row["Age"] = age;
            row["Gender"] = gender;
            row["BloodGroup"] = bg;
            row["ContactNumber"] = phone;
            row["Email"] = email;
            row["HospitalName"] = hospital;
            row["RequestReason"] = reason;
            row["CreatedAt"] = DateTime.Now;
            _acceptors.Rows.Add(row);
            return (int)row["AcceptorId"];
        }
    }

    public static DataTable GetAcceptors()
    {
        return _acceptors;
    }

    public static DataRow GetAcceptorByEmail(string email)
    {
        foreach (DataRow row in _acceptors.Rows)
        {
            if (string.Equals(row["Email"].ToString(), email, StringComparison.OrdinalIgnoreCase))
                return row;
        }
        return null;
    }

    public static void UpdateAcceptor(int id, string name, int age, string gender, string bg, string phone, string email, string hospital, string reason)
    {
        lock (_lock)
        {
            DataRow row = _acceptors.Rows.Find(id);
            if (row == null) return;
            row["Name"] = name;
            row["Age"] = age;
            row["Gender"] = gender;
            row["BloodGroup"] = bg;
            row["ContactNumber"] = phone;
            row["Email"] = email;
            row["HospitalName"] = hospital;
            row["RequestReason"] = reason;
        }
    }

    public static void DeleteAcceptor(int id)
    {
        lock (_lock)
        {
            DataRow row = _acceptors.Rows.Find(id);
            if (row != null) _acceptors.Rows.Remove(row);
        }
    }

    // Requests
    public static int AddRequest(int acceptorId, int? donorId, string bg, int units, string urgency, string notes)
    {
        lock (_lock)
        {
            DataRow row = _requests.NewRow();
            row["RequestId"] = NextId(_requests, "RequestId");
            row["AcceptorId"] = acceptorId;
            row["DonorId"] = donorId.HasValue ? (object)donorId.Value : DBNull.Value;
            row["BloodGroup"] = bg;
            row["Units"] = units;
            row["Urgency"] = urgency;
            row["Status"] = "Pending";
            row["Notes"] = notes;
            row["CreatedAt"] = DateTime.Now;
            _requests.Rows.Add(row);
            return (int)row["RequestId"];
        }
    }

    public static DataTable GetRequests()
    {
        return _requests;
    }

    public static void SetRequestStatus(int requestId, string status)
    {
        lock (_lock)
        {
            DataRow row = _requests.Rows.Find(requestId);
        }
    }
}
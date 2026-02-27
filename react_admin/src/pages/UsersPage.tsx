export const UsersPage = () => (
  <div>
    <h1>User Management</h1>
    <table width="100%" cellPadding={8} style={{borderCollapse:'collapse'}}>
      <thead><tr><th align="left">Email</th><th>Status</th><th>Seller</th><th>Action</th></tr></thead>
      <tbody>
        <tr><td>seller@olxclone.com</td><td>Active</td><td>Verified</td><td><button>Block</button> <button>Unblock</button></td></tr>
      </tbody>
    </table>
  </div>
);

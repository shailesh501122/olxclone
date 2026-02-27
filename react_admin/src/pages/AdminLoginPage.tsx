export const AdminLoginPage = ({ onLogin }: { onLogin: () => void }) => (
  <div style={{maxWidth:380, margin:'60px auto', border:'1px solid #ddd', borderRadius:12, padding:20}}>
    <h1>Admin Login</h1>
    <input placeholder='Email' style={{width:'100%', marginBottom:8}} />
    <input placeholder='Password' type='password' style={{width:'100%', marginBottom:12}} />
    <button onClick={onLogin}>Login</button>
    <p style={{fontSize:12}}>Email/password only.</p>
  </div>
);

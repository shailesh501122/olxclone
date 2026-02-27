export const DashboardPage = () => {
  const stats = [
    ['Total Users', '12,400'],
    ['Total Listings', '53,220'],
    ['Active Ads', '40,002'],
    ['Reports', '67']
  ];
  return <div>
    <h1>Dashboard</h1>
    <div style={{display:'grid', gridTemplateColumns:'repeat(4,1fr)', gap:12}}>
      {stats.map(([k,v]) => <div key={k} style={{border:'1px solid #ddd', borderRadius:12, padding:12}}><div>{k}</div><strong>{v}</strong></div>)}
    </div>
  </div>;
};

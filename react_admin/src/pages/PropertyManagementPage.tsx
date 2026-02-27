import { useMemo, useState } from 'react';

type Row = { id: string; title: string; city: string; status: string; featured: boolean; boostRevenue: number };

const sample: Row[] = [
  { id: '1', title: '2 BHK Apartment, Andheri', city: 'Mumbai', status: 'Pending', featured: false, boostRevenue: 1200 },
  { id: '2', title: '3 BHK Villa, Whitefield', city: 'Bengaluru', status: 'Approved', featured: true, boostRevenue: 2600 },
];

export const PropertyManagementPage = () => {
  const [city, setCity] = useState('All');
  const rows = useMemo(() => city === 'All' ? sample : sample.filter(x => x.city === city), [city]);
  const revenue = rows.reduce((a, b) => a + b.boostRevenue, 0);

  return <div>
    <h1>Property Management</h1>
    <div style={{display:'flex', gap:12, alignItems:'center', marginBottom:12}}>
      <label>Filter by city:</label>
      <select value={city} onChange={e => setCity(e.target.value)}>
        <option>All</option><option>Mumbai</option><option>Bengaluru</option>
      </select>
      <strong>Revenue from boosts: ₹ {revenue.toLocaleString()}</strong>
    </div>
    <table width="100%" cellPadding={8} style={{borderCollapse:'collapse'}}>
      <thead><tr><th align='left'>Title</th><th align='left'>City</th><th align='left'>Status</th><th align='left'>Featured</th><th>Actions</th></tr></thead>
      <tbody>
      {rows.map(r => <tr key={r.id}>
        <td>{r.title}</td><td>{r.city}</td><td>{r.status}</td><td>{String(r.featured)}</td>
        <td><button>Approve</button> <button>Reject</button> <button>Feature</button> <button>Delete</button> <button>Reports</button></td>
      </tr>)}
      </tbody>
    </table>
  </div>;
};

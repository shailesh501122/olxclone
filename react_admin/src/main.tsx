import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import { DashboardPage } from './pages/DashboardPage';
import { UsersPage } from './pages/UsersPage';
import { ListingsPage } from './pages/ListingsPage';
import { ReportsPage } from './pages/ReportsPage';
import { PaymentsPage } from './pages/PaymentsPage';

const App = () => (
  <BrowserRouter>
    <div style={{ display: 'grid', gridTemplateColumns: '220px 1fr', minHeight: '100vh' }}>
      <aside style={{ padding: 16, background: '#073042', color: 'white' }}>
        <h2>OLX Admin</h2>
        <nav style={{ display: 'grid', gap: 8 }}>
          <Link to="/" style={{ color: 'white' }}>Dashboard</Link>
          <Link to="/users" style={{ color: 'white' }}>Users</Link>
          <Link to="/listings" style={{ color: 'white' }}>Listings</Link>
          <Link to="/reports" style={{ color: 'white' }}>Reports</Link>
          <Link to="/payments" style={{ color: 'white' }}>Payments</Link>
        </nav>
      </aside>
      <main style={{ padding: 20 }}>
        <Routes>
          <Route path="/" element={<DashboardPage />} />
          <Route path="/users" element={<UsersPage />} />
          <Route path="/listings" element={<ListingsPage />} />
          <Route path="/reports" element={<ReportsPage />} />
          <Route path="/payments" element={<PaymentsPage />} />
        </Routes>
      </main>
    </div>
  </BrowserRouter>
);

ReactDOM.createRoot(document.getElementById('root')!).render(<App />);

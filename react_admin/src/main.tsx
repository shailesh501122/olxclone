import React, { useState } from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import { DashboardPage } from './pages/DashboardPage';
import { UsersPage } from './pages/UsersPage';
import { ListingsPage } from './pages/ListingsPage';
import { ReportsPage } from './pages/ReportsPage';
import { PaymentsPage } from './pages/PaymentsPage';
import { PropertyManagementPage } from './pages/PropertyManagementPage';
import { AdminLoginPage } from './pages/AdminLoginPage';

const Shell = () => (
  <div style={{ display: 'grid', gridTemplateColumns: '240px 1fr', minHeight: '100vh' }}>
    <aside style={{ padding: 16, background: '#073042', color: 'white' }}>
      <h2>indiawish Admin</h2>
      <nav style={{ display: 'grid', gap: 8 }}>
        <Link to='/' style={{ color: 'white' }}>Dashboard</Link>
        <Link to='/users' style={{ color: 'white' }}>Users</Link>
        <Link to='/listings' style={{ color: 'white' }}>Listings</Link>
        <Link to='/properties' style={{ color: 'white' }}>Properties</Link>
        <Link to='/reports' style={{ color: 'white' }}>Reports</Link>
        <Link to='/payments' style={{ color: 'white' }}>Payments</Link>
      </nav>
    </aside>
    <main style={{ padding: 20 }}>
      <Routes>
        <Route path='/' element={<DashboardPage />} />
        <Route path='/users' element={<UsersPage />} />
        <Route path='/listings' element={<ListingsPage />} />
        <Route path='/properties' element={<PropertyManagementPage />} />
        <Route path='/reports' element={<ReportsPage />} />
        <Route path='/payments' element={<PaymentsPage />} />
      </Routes>
    </main>
  </div>
);

const App = () => {
  const [loggedIn, setLoggedIn] = useState(false);
  if (!loggedIn) return <AdminLoginPage onLogin={() => setLoggedIn(true)} />;
  return <BrowserRouter><Shell /></BrowserRouter>;
};

ReactDOM.createRoot(document.getElementById('root')!).render(<App />);

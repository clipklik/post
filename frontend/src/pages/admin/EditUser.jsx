import { useState, useEffect } from "react";
import { useParams, useNavigate, Link } from "react-router-dom";
import { FiUser, FiCreditCard, FiMail, FiBookOpen, FiShield, FiSave, FiArrowLeft, FiAlertCircle } from "react-icons/fi";
import axios from "axios";

const EditUser = () => {
  const { id } = useParams();
  const navigate = useNavigate();

  // 1. STATE FORM DATA
  const [formData, setFormData] = useState({
    name: '',
    nim: '',
    email: '',
    department: '',
    role: ''
  });

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  // 2. MENGAMBIL DATA DARI BACKEND
  useEffect(() => {
    const fetchUser = async () => {
      try {
        const response = await axios.get(`http://localhost:5000/api/auth/users/${id}`);
        // 🔥 PERBAIKAN 1: Tangkap datanya dari response.data
        const userData = response.data;
        
        setFormData({
          name: userData.name || '',
          nim: userData.nim || userData.nim_nidn || '', 
          email: userData.email || '',
          department: userData.department || '',
          role: userData.role || 'user' // Default ke user/mahasiswa
        });
      } catch (err) {
        setError("Gagal memuat data pengguna.");
        console.error(err);
      } finally {
        setLoading(false);
      }
    };
    fetchUser();
  }, [id]);

  // 🔥 PERBAIKAN 2: Fungsi untuk menangani ketikan di keyboard
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  // 3. MENYIMPAN DATA KE BACKEND
  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);
    setError('');

    try {
      await axios.put(`http://localhost:5000/api/auth/users/${id}`, formData);
      // Kembali ke halaman kelola pengguna setelah sukses
      navigate('/admin/users', { state: { activeTab: 'approved' } });
    } catch (err) {
      setError(err.response?.data?.message || "Terjadi kesalahan saat menyimpan data.");
    } finally {
      setSaving(false);
    }
  };

  if (loading) return <div className="p-8 text-slate-500 font-bold animate-pulse">Memuat form edit...</div>;

  return (
    <div className="p-4 md:p-8 md:pt-6 max-w-3xl mx-auto">
      
      {/* HEADER & TOMBOL KEMBALI */}
      <div className="mb-6 flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-slate-800 dark:text-white">Edit Profil Pengguna</h1>
          <p className="text-slate-500 dark:text-slate-400 text-sm mt-0.5">Perbarui informasi dasar akun pengguna ini.</p>
        </div>
        <Link to="/admin/users" className="p-2.5 bg-slate-100 dark:bg-slate-800 text-slate-500 dark:text-slate-400 hover:text-indigo-600 dark:hover:text-indigo-400 rounded-xl transition-colors">
          <FiArrowLeft size={20} />
        </Link>
      </div>

      {error && (
        <div className="mb-6 p-4 flex items-center gap-3 bg-rose-50 dark:bg-rose-500/10 border border-rose-200 dark:border-rose-500/30 rounded-xl text-rose-600 dark:text-rose-400 text-sm font-bold">
          <FiAlertCircle className="shrink-0 text-lg" /> {error}
        </div>
      )}

      {/* FORM BUNGKUS */}
      <div className="bg-white dark:bg-[#131C31] rounded-2xl shadow-sm border border-slate-200 dark:border-slate-800 overflow-hidden">
        <form onSubmit={handleSubmit} className="p-6 md:p-8 space-y-6">
          
          {/* NAMA LENGKAP */}
          <div>
            <label className="block text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-2 ml-1">Nama Lengkap</label>
            <div className="relative">
              <FiUser className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
              <input type="text" name="name" value={formData.name} onChange={handleChange} required 
                className="w-full pl-11 pr-4 py-3.5 bg-slate-50 dark:bg-[#0B1121] border border-slate-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 outline-none text-sm font-medium text-slate-800 dark:text-slate-200 transition-all" />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* NIM / USERNAME */}
            <div>
              <label className="block text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-2 ml-1">Username / NIM</label>
              <div className="relative">
                <FiCreditCard className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
                <input type="text" name="nim" value={formData.nim} onChange={handleChange} required 
                  className="w-full pl-11 pr-4 py-3.5 bg-slate-50 dark:bg-[#0B1121] border border-slate-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 outline-none text-sm font-medium text-slate-800 dark:text-slate-200 transition-all" />
              </div>
            </div>

            {/* EMAIL AKTIF */}
            <div>
              <label className="block text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-2 ml-1">Email Pemulihan</label>
              <div className="relative">
                <FiMail className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
                <input type="email" name="email" value={formData.email} onChange={handleChange} placeholder="Ketik email aktif di sini..."
                  className="w-full pl-11 pr-4 py-3.5 bg-slate-50 dark:bg-[#0B1121] border border-slate-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 outline-none text-sm font-medium text-slate-800 dark:text-slate-200 transition-all" />
              </div>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* PROGRAM STUDI / BAGIAN */}
            <div>
              <label className="block text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-2 ml-1">Program Studi / Bagian</label>
              <div className="relative">
                <FiBookOpen className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 z-10" />
                <select name="department" value={formData.department} onChange={handleChange}
                  className="w-full pl-11 pr-4 py-3.5 bg-slate-50 dark:bg-[#0B1121] border border-slate-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 outline-none text-sm font-bold text-slate-800 dark:text-slate-200 appearance-none cursor-pointer relative z-0">
                  <option value="">-- Pilih Bagian --</option>
                  <option value="Teknik Informatika">D3 Teknik Informatika</option>
                  <option value="Teknik Mesin">D3 Teknik Mesin</option>
                  <option value="Teknik Otomotif">D3 Teknik Otomotif</option>
                  <option value="Teknik Elektronika">D3 Teknik Elektronika</option>
                  <option value="Pusat / Manajemen">Pusat / Manajemen (Staf)</option>
                </select>
              </div>
            </div>

            {/* HAK AKSES (ROLE) */}
            <div>
              <label className="block text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-2 ml-1">Hak Akses (Role)</label>
              <div className="relative">
                <FiShield className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 z-10" />
                <select name="role" value={formData.role} onChange={handleChange} required
                  className="w-full pl-11 pr-4 py-3.5 bg-slate-50 dark:bg-[#0B1121] border border-slate-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 outline-none text-sm font-bold text-slate-800 dark:text-slate-200 appearance-none cursor-pointer relative z-0">
                  <option value="user">Mahasiswa</option>
                  <option value="dosen">Dosen</option>
                  <option value="admin">Administrator (Perpus)</option>
                </select>
              </div>
            </div>
          </div>

          <div className="pt-4 border-t border-slate-100 dark:border-slate-800 flex justify-end">
            <button type="submit" disabled={saving} className="w-full md:w-auto bg-amber-500 hover:bg-amber-600 text-white px-8 py-3.5 rounded-xl font-bold flex items-center justify-center gap-2 transition-all shadow-lg shadow-amber-500/20">
              {saving ? (
                <div className="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
              ) : (
                <><FiSave className="text-lg" /> Simpan Perubahan</>
              )}
            </button>
          </div>

        </form>
      </div>

    </div>
  );
};

export default EditUser;
import React, { useState } from 'react';
import { Dialog } from '@headlessui/react';
import { X } from 'lucide-react';

interface AddFieldProps {
  isOpen: boolean;
  onClose: () => void;
  onFieldAdded: () => void;
}

export default function AddField({ isOpen, onClose, onFieldAdded }: AddFieldProps) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [formData, setFormData] = useState({
    name: '',
    area: '',
    location: '',
    soil_type: '',
    soil_ph: ''
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    try {
      const token = localStorage.getItem('token');
      if (!token) throw new Error('No authentication token found');

      console.log('Sending field data:', {
        name: formData.name.trim(),
        area: parseFloat(formData.area),
        location: formData.location.trim(),
        soil_type: formData.soil_type.trim(),
        soil_ph: formData.soil_ph.trim()
      });

      const response = await fetch('/api/fields', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify({
          name: formData.name.trim(),
          area: parseFloat(formData.area),
          location: formData.location.trim(),
          soil_type: formData.soil_type.trim(),
          soil_ph: formData.soil_ph.trim()
        })
      });

      const data = await response.json();
      console.log('Response:', data);

      if (!response.ok) {
        throw new Error(data.error || data.details || 'Failed to add field');
      }

      setFormData({
        name: '',
        area: '',
        location: '',
        soil_type: '',
        soil_ph: ''
      });
      
      onFieldAdded();
      onClose();
    } catch (err: any) {
      console.error('Error in handleSubmit:', err);
      setError(err.message || 'Failed to add field');
    } finally {
      setLoading(false);
    }
  };

  return (
    <Dialog open={isOpen} onClose={onClose} className="relative z-50">
      <div className="fixed inset-0 bg-black/30" aria-hidden="true" />
      
      <div className="fixed inset-0 flex items-center justify-center p-4">
        <Dialog.Panel className="bg-white rounded-lg shadow-xl max-w-md w-full p-6">
          <div className="flex justify-between items-center mb-4">
            <Dialog.Title className="text-lg font-semibold">Add New Field</Dialog.Title>
            <button onClick={onClose} className="text-gray-400 hover:text-gray-500">
              <X className="h-5 w-5" />
            </button>
          </div>

          {error && (
            <div className="mb-4 p-3 bg-red-50 text-red-700 rounded-md">
              {error}
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700">Field Name</label>
              <input
                type="text"
                value={formData.name}
                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
                required
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700">Area (acres)</label>
                <input
                  type="number"
                  value={formData.area}
                  onChange={(e) => setFormData({ ...formData, area: e.target.value })}
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
                  required
                  min="0.1"
                  step="0.1"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700">Location</label>
                <input
                  type="text"
                  value={formData.location}
                  onChange={(e) => setFormData({ ...formData, location: e.target.value })}
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
                  required
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700">Soil Type</label>
                <input
                  type="text"
                  value={formData.soil_type}
                  onChange={(e) => setFormData({ ...formData, soil_type: e.target.value })}
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700">Soil pH</label>
                <input
                  type="text"
                  value={formData.soil_ph}
                  onChange={(e) => setFormData({ ...formData, soil_ph: e.target.value })}
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
                  required
                />
              </div>
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full bg-green-600 text-white rounded-lg px-4 py-2 hover:bg-green-700 disabled:opacity-50"
            >
              {loading ? 'Adding...' : 'Add Field'}
            </button>
          </form>
        </Dialog.Panel>
      </div>
    </Dialog>
  );
} 
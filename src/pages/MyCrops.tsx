import React, { useState, useEffect } from 'react';
import { Plus, AlertCircle, Loader2, Sprout } from 'lucide-react';
import { useAuth } from '../context/AuthContext';
import type { Crop, CropGuide } from '../types/Crop';
import AddCrop from '../components/AddCrop';
import FieldsSection from '../components/FieldsSection';
import type { Field } from '../types/Field';
import AddField from '../components/AddField';

export default function MyCrops() {
  const [crops, setCrops] = useState<Crop[]>([]);
  const [guides, setGuides] = useState<CropGuide[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [isAddCropOpen, setIsAddCropOpen] = useState(false);
  const [fields, setFields] = useState<Field[]>([]);
  const [isAddFieldOpen, setIsAddFieldOpen] = useState(false);
  const { user } = useAuth();

  useEffect(() => {
    fetchCrops();
    fetchCropGuides();
    fetchFields();
  }, []);

  const fetchCrops = async () => {
    try {
      const token = localStorage.getItem('token');
      if (!token) {
        throw new Error('No authentication token found');
      }

      const response = await fetch('/api/crops', {
        headers: {
          'Authorization': `Bearer ${token}`,
          'Accept': 'application/json'
        }
      });
      
      if (!response.ok) throw new Error('Failed to fetch crops');
      const data = await response.json();
      setCrops(data);
      setError('');
    } catch (err: any) {
      setError(err.message || 'Failed to load crops');
    }
  };

  const fetchCropGuides = async () => {
    try {
      const response = await fetch('/api/crops/guides');
      if (!response.ok) throw new Error('Failed to fetch crop guides');
      const data = await response.json();
      setGuides(data);
    } finally {
      setLoading(false);
    }
  };

  const fetchFields = async () => {
    try {
      const token = localStorage.getItem('token');
      if (!token) throw new Error('No authentication token found');
      
      const response = await fetch('/api/fields', {
        headers: {
          'Authorization': `Bearer ${token}`,
          'Accept': 'application/json'
        }
      });
      
      if (!response.ok) throw new Error('Failed to fetch fields');
      const data = await response.json();
      setFields(data);
    } catch (err: any) {
      setError(err.message || 'Failed to load fields');
    }
  };

  const handleCropAdded = () => {
    fetchCrops();
    setIsAddCropOpen(false);
  };

  const handleFieldAdded = async () => {
    try {
      await fetchFields();
      setIsAddFieldOpen(false);
    } catch (err) {
      console.error('Error refreshing fields:', err);
    }
  };

  if (loading) return (
    <div className="flex justify-center items-center py-12">
      <Loader2 className="h-8 w-8 animate-spin text-green-600" />
    </div>
  );

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-2xl font-bold text-gray-900">My Crops</h1>
        <button
          onClick={() => setIsAddCropOpen(true)}
          className="flex items-center space-x-2 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700"
        >
          <Plus className="h-5 w-5" />
          <span>Add Crop</span>
        </button>
      </div>

      {error && (
        <div className="bg-red-50 border border-red-200 rounded-lg p-4 flex items-center text-red-700">
          <AlertCircle className="h-5 w-5 mr-2" />
          {error}
        </div>
      )}

      <FieldsSection 
        fields={fields}
        onAddField={() => setIsAddFieldOpen(true)}
      />

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {crops.map((crop) => (
          <div key={crop.id} className="bg-white rounded-lg shadow-sm p-6">
            <div className="flex items-center space-x-3 mb-4">
              <Sprout className="h-6 w-6 text-green-600" />
              <h3 className="text-lg font-semibold">{crop.name}</h3>
            </div>
            <div className="space-y-3">
              <div className="flex justify-between">
                <span className="text-gray-600">Area</span>
                <span>{crop.area} acres</span>
              </div>
              <div className="flex justify-between">
                <span className="text-gray-600">Planting Date</span>
                <span>{new Date(crop.planting_date).toLocaleDateString()}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-gray-600">Expected Harvest</span>
                <span>{new Date(crop.expected_harvest).toLocaleDateString()}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-gray-600">Status</span>
                <span className={`capitalize px-2 py-1 rounded-full text-sm ${
                  crop.status === 'growing' ? 'bg-green-100 text-green-800' :
                  crop.status === 'harvested' ? 'bg-blue-100 text-blue-800' :
                  'bg-red-100 text-red-800'
                }`}>
                  {crop.status}
                </span>
              </div>
            </div>
            {crop.notes && (
              <p className="mt-4 text-sm text-gray-600 border-t pt-4">
                {crop.notes}
              </p>
            )}
          </div>
        ))}
      </div>

      {crops.length === 0 && (
        <div className="text-center py-12 bg-white rounded-lg shadow-sm">
          <Sprout className="h-12 w-12 text-gray-400 mx-auto mb-4" />
          <p className="text-gray-500">No crops added yet</p>
        </div>
      )}

      <div className="mt-8">
        <h2 className="text-xl font-semibold mb-4">Crop Growing Guides</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {guides.map((guide) => (
            <div key={guide.id} className="bg-white rounded-lg shadow-sm p-6">
              <h3 className="text-lg font-semibold mb-4">{guide.crop_name}</h3>
              <div className="space-y-3 text-sm">
                <div>
                  <span className="font-medium">Best Season:</span> {guide.season}
                </div>
                <div>
                  <span className="font-medium">Soil Type:</span> {guide.soil_type}
                </div>
                <div>
                  <span className="font-medium">Water Requirements:</span> {guide.water_requirements}
                </div>
                <div>
                  <span className="font-medium">Fertilizer:</span> {guide.fertilizer_recommendations}
                </div>
                <div>
                  <span className="font-medium">Pest Control:</span> {guide.pest_control}
                </div>
                <div>
                  <span className="font-medium">Harvesting Tips:</span> {guide.harvesting_tips}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      <AddCrop 
        isOpen={isAddCropOpen} 
        onClose={() => setIsAddCropOpen(false)} 
        onCropAdded={handleCropAdded}
      />

      <AddField 
        isOpen={isAddFieldOpen}
        onClose={() => setIsAddFieldOpen(false)}
        onFieldAdded={handleFieldAdded}
      />
    </div>
  );
}
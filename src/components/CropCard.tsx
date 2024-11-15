import React from 'react';
import { Calendar, ArrowRight } from 'lucide-react';
import type { Crop } from '../types/Crop';

interface CropCardProps {
  crop: Crop;
  onStatusUpdate: () => void;
}

export default function CropCard({ crop, onStatusUpdate }: CropCardProps) {
  const handleStatusChange = async (newStatus: string) => {
    try {
      const token = localStorage.getItem('token');
      const response = await fetch(`/api/crops/${crop.id}/status`, {
        method: 'PATCH',
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ status: newStatus })
      });

      if (!response.ok) throw new Error('Failed to update status');
      onStatusUpdate();
    } catch (error) {
      console.error('Error updating crop status:', error);
    }
  };

  return (
    <div className="bg-white rounded-lg shadow-sm p-6">
      <div className="flex justify-between items-start mb-4">
        <h3 className="text-lg font-semibold">{crop.name}</h3>
        <span className={`px-2 py-1 rounded-full text-xs font-medium ${
          crop.status === 'growing' ? 'bg-green-100 text-green-800' :
          crop.status === 'harvested' ? 'bg-blue-100 text-blue-800' :
          'bg-red-100 text-red-800'
        }`}>
          {crop.status}
        </span>
      </div>
      
      <div className="space-y-3 text-sm">
        <div className="flex items-center">
          <Calendar className="h-4 w-4 text-gray-400 mr-2" />
          <span>Planted: {new Date(crop.planting_date).toLocaleDateString()}</span>
        </div>
        <div className="flex items-center">
          <ArrowRight className="h-4 w-4 text-gray-400 mr-2" />
          <span>Expected Harvest: {new Date(crop.expected_harvest).toLocaleDateString()}</span>
        </div>
        <div>
          <span className="font-medium">Area:</span> {crop.area} acres
        </div>
        {crop.notes && (
          <div>
            <span className="font-medium">Notes:</span> {crop.notes}
          </div>
        )}
      </div>

      {crop.status === 'growing' && (
        <div className="mt-4 space-x-2">
          <button
            onClick={() => handleStatusChange('harvested')}
            className="px-3 py-1 text-sm font-medium text-white bg-green-600 hover:bg-green-700 rounded-md"
          >
            Harvest
          </button>
        </div>
      )}
    </div>
  );
} 
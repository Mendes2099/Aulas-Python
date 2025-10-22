import React from 'react';
import { CalendarIcon } from 'lucide-react';
export function MeetingScheduler() {
  return <div className="bg-white dark:bg-gray-700 p-6 rounded-lg shadow-md w-full h-full">
      <div className="flex items-center mb-4">
        <CalendarIcon size={24} className="text-indigo-600 dark:text-indigo-400 mr-2" />
        <h3 className="text-xl font-bold text-gray-800 dark:text-white">
          Schedule a Meeting
        </h3>
      </div>
      <p className="text-gray-600 dark:text-gray-300 mb-4">
        Book a time that works for you using my online calendar. I'm looking
        forward to our conversation!
      </p>
      <div className="w-full rounded-lg overflow-hidden border border-gray-200 dark:border-gray-700 bg-white">
        <iframe src="https://calendar.google.com/calendar/embed?src=mendes19966%40gmail.com&ctz=Europe%2FLisbon" className="border border-gray-400"
          width="550"
          height="600"
          frameBorder="0"
          scrolling="no"
          title="Google Calendar"></iframe>

      </div>
      <p className="text-gray-500 dark:text-gray-400 text-sm mt-4">
        Can't find a suitable time? Please send me a message with your
        availability.
      </p>
    </div>;
}
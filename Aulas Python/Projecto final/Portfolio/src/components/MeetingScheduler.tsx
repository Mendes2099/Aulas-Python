import React from 'react';
import { CalendarIcon } from 'lucide-react';
export function MeetingScheduler() {
  return <div className="bg-white dark:bg-gray-700 p-6 rounded-lg shadow-md w-full">
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
        <iframe
          src="https://calendar.google.com/calendar/embed?height=600&wkst=1&ctz=Europe%2FLisbon&showPrint=0&src=bWVuZGVzMTk5NjZAZ21haWwuY29t&src=Y2xhc3Nyb29tMTEzNjAxNjA4OTE1NTcxODAyODE4QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=Y2xhc3Nyb29tMTE1Nzc0OTU3ODg2ODYzNTM2MDQ1QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=Y2xhc3Nyb29tMTE2MjA5NzIyMjE4Nzg0ODYyNDExQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=Y2xhc3Nyb29tMTEyNDY5ODcyMjk4NjYyNTEwMjg1QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=Y2xhc3Nyb29tMTE3ODQzNzY5MTU4NjEwMjY1MjM1QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=Y2xhc3Nyb29tMTA3NDk3MDEyODMzMzYzNTM4MTQ2QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=Y2xhc3Nyb29tMTAyNTQzNjA4OTA3ODM3NjI1NjAxQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&src=cHQucG9ydHVndWVzZSNob2xpZGF5QGdyb3VwLnYuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&color=%23039be5&color=%23202124&color=%23202124&color=%23007b83&color=%231967d2&color=%231967d2&color=%23202124&color=%23202124&color=%237986cb"
          className="border border-gray-400"
          width="800"
          height="600"
          frameBorder="0"
          scrolling="no"
          title="Google Calendar"
        ></iframe>
      </div>
      <p className="text-gray-500 dark:text-gray-400 text-sm mt-4">
        Can't find a suitable time? Please send me a message with your
        availability.
      </p>
    </div>;
}
import React from 'react';
import { SunIcon, MoonIcon } from 'lucide-react';
import { useTheme } from './ThemeProvider';
export function ThemeToggle() {
  const {
    theme,
    toggleTheme
  } = useTheme();
  return <button onClick={toggleTheme} className="p-2 rounded-full bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-200 transition-colors duration-200" aria-label={theme === 'light' ? 'Switch to dark mode' : 'Switch to light mode'}>
      {theme === 'light' ? <MoonIcon size={18} /> : <SunIcon size={18} />}
    </button>;
}
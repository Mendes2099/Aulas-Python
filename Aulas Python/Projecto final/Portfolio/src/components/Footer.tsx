import React from 'react';
import { GithubIcon, LinkedinIcon, TwitterIcon, HeartIcon } from 'lucide-react';
export function Footer() {
  const currentYear = new Date().getFullYear();
  return <footer className="bg-gray-800 dark:bg-gray-900 text-white py-12 transition-colors duration-200">
      <div className="container mx-auto px-4">
        <div className="flex flex-col md:flex-row justify-between items-center">
          <div className="mb-6 md:mb-0">
                    <h2 className="text-2xl font-bold italic text-gray-800 dark:text-white">
          João<span className="text-indigo-600 dark:text-indigo-400"> Mendes
            </span>
        </h2>
            <p className="text-gray-400 max-w-xs">
              Creating experiences with modern
              technologies.
            </p>
          </div>
          <div className="flex flex-col items-center md:items-end">
            <div className="flex space-x-4 mb-4">
            <a href="https://www.linkedin.com/in/jo%C3%A3ofilipemendes/" target="_blank" rel="noopener noreferrer" className="text-gray-600 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors duration-300">
              <LinkedinIcon size={24} />
            </a>
            <a href="https://github.com/Mendes2099" target="_blank" rel="noopener noreferrer" className="text-gray-600 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors duration-300">
              <GithubIcon size={24} />
            </a>
            </div>
            <div className="flex flex-wrap justify-center gap-x-4 gap-y-2 text-sm text-gray-400">
              <a href="#home" className="hover:text-white transition-colors duration-300">
                Home
              </a>
              <a href="#about" className="hover:text-white transition-colors duration-300">
                About
              </a>
              <a href="#skills" className="hover:text-white transition-colors duration-300">
                Skills
              </a>
              <a href="#projects" className="hover:text-white transition-colors duration-300">
                Projects
              </a>
              <a href="#contact" className="hover:text-white transition-colors duration-300">
                Contact
              </a>
            </div>
          </div>
        </div>
        <div className="border-t border-gray-700 mt-8 pt-8 flex flex-col md:flex-row justify-between items-center">
          <p className="text-gray-400 text-sm">
            &copy; {currentYear} João Mendes. All rights reserved.
          </p>
          <p className="text-gray-400 text-sm flex items-center mt-4 md:mt-0">
            Made with <HeartIcon size={14} className="mx-1 text-red-500" />
          </p>
        </div>
      </div>
    </footer>;
}
import React, { useEffect, useState } from 'react';
import { MenuIcon, XIcon } from 'lucide-react';
import { ThemeToggle } from './ThemeToggle';
import { motion } from 'framer-motion';
export function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 10) {
        setScrolled(true);
      } else {
        setScrolled(false);
      }
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);
  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };
  const scrollToSection = (id: string) => {
    const element = document.getElementById(id);
    if (element) {
      // Enhanced smooth scroll
      window.scrollTo({
        top: element.offsetTop - 80,
        behavior: 'smooth'
      });
      setIsMenuOpen(false);
    }
  };
  return <motion.header initial={{
    y: -100
  }} animate={{
    y: 0
  }} transition={{
    duration: 0.5,
    ease: 'easeOut'
  }} className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${scrolled ? 'bg-white dark:bg-gray-800 shadow-md py-2' : 'bg-transparent py-4'}`}>
      <div className="container mx-auto px-4 flex justify-between items-center">
        <motion.div className="text-2xl font-bold italic text-gray-800 dark:text-white" initial={{
        opacity: 0
      }} animate={{
        opacity: 1
      }} transition={{
        duration: 0.5,
        delay: 0.2
      }}>
          My
          <span className="text-indigo-600 dark:text-indigo-400">
            Portfolio
          </span>
        </motion.div>
        {/* Desktop Navigation */}
        <div className="hidden md:flex items-center space-x-8">
          <nav className="flex space-x-8">
            {['home', 'about', 'skills', 'projects', 'contact'].map((item, index) => <motion.button key={item} onClick={() => scrollToSection(item)} className="text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white font-medium capitalize" initial={{
            opacity: 0,
            y: -20
          }} animate={{
            opacity: 1,
            y: 0
          }} transition={{
            duration: 0.5,
            delay: 0.1 * (index + 1)
          }}>
                  {item}
                </motion.button>)}
          </nav>
          <motion.div initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} transition={{
          duration: 0.5,
          delay: 0.6
        }}>
            <ThemeToggle />
          </motion.div>
        </div>
        {/* Mobile Menu Button and Theme Toggle */}
        <div className="md:hidden flex items-center space-x-4">
          <motion.div initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} transition={{
          duration: 0.5
        }}>
            <ThemeToggle />
          </motion.div>
          <motion.button className="text-gray-700 dark:text-gray-300 focus:outline-none" onClick={toggleMenu} initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} transition={{
          duration: 0.5,
          delay: 0.1
        }}>
            {isMenuOpen ? <XIcon size={24} /> : <MenuIcon size={24} />}
          </motion.button>
        </div>
      </div>
      {/* Mobile Menu */}
      {isMenuOpen && <motion.div className="md:hidden bg-white dark:bg-gray-800 absolute top-full left-0 right-0 shadow-md" initial={{
      opacity: 0,
      height: 0
    }} animate={{
      opacity: 1,
      height: 'auto'
    }} transition={{
      duration: 0.3
    }}>
          <div className="container mx-auto px-4 py-3 flex flex-col space-y-3">
            {['home', 'about', 'skills', 'projects', 'contact'].map((item, index) => <motion.button key={item} onClick={() => scrollToSection(item)} className="text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white font-medium py-2 capitalize text-left" initial={{
          opacity: 0,
          x: -20
        }} animate={{
          opacity: 1,
          x: 0
        }} transition={{
          duration: 0.3,
          delay: 0.05 * (index + 1)
        }}>
                  {item}
                </motion.button>)}
          </div>
        </motion.div>}
    </motion.header>;
}
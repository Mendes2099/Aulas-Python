import React from 'react';
import { ArrowDownIcon, GithubIcon, LinkedinIcon } from 'lucide-react';
import { TypeAnimation } from 'react-type-animation';
import { motion } from 'framer-motion';
export function Hero() {
  const scrollToContact = () => {
    const element = document.getElementById('contact');
    if (element) {
      element.scrollIntoView({
        behavior: 'smooth'
      });
    }
  };
  return <section id="home" className="min-h-screen w-full flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-50 dark:from-gray-900 dark:to-indigo-950 pt-16 transition-colors duration-200">
      <div className="container mx-auto px-4 py-16 flex flex-col md:flex-row items-center justify-between">
        <motion.div className="md:w-1/2 mb-10 md:mb-0" initial={{
        opacity: 0,
        x: -50
      }} animate={{
        opacity: 1,
        x: 0
      }} transition={{
        duration: 0.8,
        ease: 'easeOut'
      }}>
          <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-800 dark:text-white mb-4">
            Hi, I'm{' '}
            <span className="text-indigo-600 dark:text-indigo-400">
              <TypeAnimation sequence={['João Mendes.', 2000, 'Thankful.', 1000, 'Happy.', 1000, 'João Mendes.', 9000]} wrapper="span" speed={30} repeat={Infinity} />
            </span>
          </h1>
          <motion.p className="text-xl md:text-2xl text-gray-600 italic dark:text-gray-300 mb-6" initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} transition={{
          duration: 0.8,
          delay: 0.3
        }}>
            Software Developer
          </motion.p>
          <motion.p className="text-gray-600 dark:text-gray-400 mb-8 max-w-lg" initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} transition={{
          duration: 0.8,
          delay: 0.5
        }}>
            I build practical and modern applications. From intelligent
            assistants to dynamic websites, let's work together to turn your
            ideas into real solutions.
          </motion.p>
          <motion.div className="flex flex-wrap gap-4" initial={{
            opacity: 0,
            y: 20
          }} animate={{
            opacity: 1,
            y: 0
          }} transition={{
            duration: 0.8,
            delay: 0.7
          }}>
            <button onClick={scrollToContact} className="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-6 rounded-full transition-colors duration-300 flex items-center justify-center">
              Hire me
            </button>
            <a href="#projects" className="border border-gray-300 dark:border-gray-600 hover:border-gray-400 dark:hover:border-gray-500 text-gray-700 dark:text-gray-300 font-medium py-2 px-6 rounded-full transition-colors duration-300 flex items-center justify-center">
              My Work
            </a>
            <a href="/CV/JoãoMendes.pdf" download className="border border-gray-300 dark:border-gray-600 hover:border-gray-400 dark:hover:border-gray-500 text-gray-700 dark:text-gray-300 font-medium py-2 px-6 rounded-full transition-colors duration-300 flex items-center justify-center">Download CV</a>
          </motion.div>
          <motion.div className="flex items-center mt-8 space-x-4" initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} transition={{
          duration: 0.8,
          delay: 0.9
        }}>
            <a href="https://github.com/Mendes2099" target="_blank" rel="noopener noreferrer" className="text-gray-600 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors duration-300">
              <GithubIcon size={24} />
            </a>
            <a href="https://www.linkedin.com/in/jo%C3%A3ofilipemendes/" target="_blank" rel="noopener noreferrer" className="text-gray-600 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors duration-300">
              <LinkedinIcon size={24} />
            </a>
          </motion.div>
        </motion.div>
        <motion.div className="md:w-1/2 flex justify-center" initial={{
        opacity: 0,
        scale: 0.8
      }} animate={{
        opacity: 1,
        scale: 1
      }} transition={{
        duration: 0.8,
        ease: 'easeOut'
      }}>
          <div className="relative w-64 h-64 md:w-80 md:h-80 rounded-full overflow-hidden border-4 border-white dark:border-gray-700 shadow-xl">
            <img src="../../public/img/me.jpeg" alt="Profile" className="w-full h-full object-cover" />
          </div>
        </motion.div>
      </div>
      <motion.div className="absolute bottom-10 left-1/2 transform -translate-x-1/2" initial={{
      opacity: 0
    }} animate={{
      opacity: 1
    }} transition={{
      duration: 1,
      delay: 1.2
    }}>
        <a href="#about" className="text-gray-500 dark:text-gray-400 hover:text-gray-700 dark:hover:text-gray-300 animate-bounce">
          <ArrowDownIcon size={24} />
        </a>
      </motion.div>
    </section>;
}
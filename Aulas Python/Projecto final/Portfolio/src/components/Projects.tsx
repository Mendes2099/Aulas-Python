import React, { useState } from 'react';
import { ExternalLinkIcon, GithubIcon } from 'lucide-react';
import { AnimateOnScroll, StaggerContainer, StaggerItem } from './AnimateOnScroll';
import { motion, AnimatePresence } from 'framer-motion';
export function Projects() {
  const [filter, setFilter] = useState('all');
  const projects = [{
    id: 1,
    title: 'E-commerce Platform',
    description: 'A full-featured online shopping platform with product catalog, cart, and payment processing.',
    image: 'https://images.unsplash.com/photo-1563013544-824ae1b704d3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
    category: 'fullstack',
    technologies: ['React', 'Node.js', 'MongoDB', 'Stripe API'],
    liveLink: '#',
    githubLink: '#'
  }, {
    id: 2,
    title: 'Task Management App',
    description: 'A productivity application for organizing tasks with drag-and-drop functionality.',
    image: 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1744&q=80',
    category: 'frontend',
    technologies: ['React', 'TypeScript', 'Redux', 'Tailwind CSS'],
    liveLink: '#',
    githubLink: '#'
  }, {
    id: 3,
    title: 'Finance Dashboard',
    description: 'Interactive dashboard with data visualization for financial analytics.',
    image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
    category: 'frontend',
    technologies: ['React', 'D3.js', 'Recharts', 'Material UI'],
    liveLink: '#',
    githubLink: '#'
  }, {
    id: 4,
    title: 'Blog API',
    description: 'RESTful API for a blog platform with authentication and content management.',
    image: 'https://images.unsplash.com/photo-1499750310107-5fef28a66643?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
    category: 'backend',
    technologies: ['Node.js', 'Express', 'MongoDB', 'JWT'],
    liveLink: '#',
    githubLink: '#'
  }, {
    id: 5,
    title: 'Weather Application',
    description: 'Real-time weather forecasting application with location-based services.',
    image: 'https://images.unsplash.com/photo-1592210454359-9043f067919b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
    category: 'fullstack',
    technologies: ['React', 'Node.js', 'OpenWeather API', 'Geolocation'],
    liveLink: '#',
    githubLink: '#'
  }, {
    id: 6,
    title: 'Portfolio Website',
    description: 'Personal portfolio website showcasing projects and skills.',
    image: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
    category: 'frontend',
    technologies: ['React', 'Tailwind CSS', 'Framer Motion'],
    liveLink: '#',
    githubLink: '#'
  }];
  const filteredProjects = filter === 'all' ? projects : projects.filter(project => project.category === filter);
  return <section id="projects" className="py-20 bg-white dark:bg-gray-900 transition-colors duration-200">
      <div className="container mx-auto px-4">
        <AnimateOnScroll>
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-800 dark:text-white mb-4">
              Projects
            </h2>
            <div className="w-24 h-1 bg-indigo-600 dark:bg-indigo-500 mx-auto"></div>
            <p className="mt-4 text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              Here are some of my recent projects. Each one was built to solve a
              specific problem or explore new technologies.
            </p>
          </div>
        </AnimateOnScroll>
        <AnimateOnScroll>
          <div className="flex justify-center mb-8">
            <div className="flex space-x-2 bg-gray-100 dark:bg-gray-700 p-1 rounded-lg">
              {['all', 'frontend', 'backend', 'fullstack'].map(category => <motion.button key={category} onClick={() => setFilter(category)} className={`px-4 py-2 rounded-md text-sm font-medium transition-colors duration-200 ${filter === category ? 'bg-indigo-600 text-white' : 'text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white'}`} whileHover={{
              scale: 1.05
            }} whileTap={{
              scale: 0.95
            }}>
                  {category.charAt(0).toUpperCase() + category.slice(1)}
                </motion.button>)}
            </div>
          </div>
        </AnimateOnScroll>
        <AnimatePresence mode="wait">
          <motion.div key={filter} initial={{
          opacity: 0
        }} animate={{
          opacity: 1
        }} exit={{
          opacity: 0
        }} transition={{
          duration: 0.3
        }}>
            <StaggerContainer className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              {filteredProjects.map(project => <StaggerItem key={project.id}>
                  <div className="bg-white dark:bg-gray-800 rounded-lg overflow-hidden shadow-md hover:shadow-xl transition-shadow duration-300 h-full">
                    <div className="h-48 overflow-hidden">
                      <img src={project.image} alt={project.title} className="w-full h-full object-cover transition-transform duration-500 hover:scale-110" />
                    </div>
                    <div className="p-6">
                      <h3 className="text-xl font-bold text-gray-800 dark:text-white mb-2">
                        {project.title}
                      </h3>
                      <p className="text-gray-600 dark:text-gray-300 mb-4">
                        {project.description}
                      </p>
                      <div className="flex flex-wrap gap-2 mb-4">
                        {project.technologies.map((tech, index) => <span key={index} className="px-2 py-1 bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 text-xs rounded-full">
                            {tech}
                          </span>)}
                      </div>
                      <div className="flex space-x-3">
                        <motion.a href={project.liveLink} className="flex items-center text-indigo-600 dark:text-indigo-400 hover:text-indigo-800 dark:hover:text-indigo-300" target="_blank" rel="noopener noreferrer" whileHover={{
                      scale: 1.05
                    }} whileTap={{
                      scale: 0.95
                    }}>
                          <ExternalLinkIcon size={16} className="mr-1" />
                          <span>Demo</span>
                        </motion.a>
                        <motion.a href={project.githubLink} className="flex items-center text-gray-700 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white" target="_blank" rel="noopener noreferrer" whileHover={{
                      scale: 1.05
                    }} whileTap={{
                      scale: 0.95
                    }}>
                          <GithubIcon size={16} className="mr-1" />
                          <span>Code</span>
                        </motion.a>
                      </div>
                    </div>
                  </div>
                </StaggerItem>)}
            </StaggerContainer>
          </motion.div>
        </AnimatePresence>
      </div>
    </section>;
}
import React from 'react';
import { CodeIcon, LayersIcon, PaletteIcon, DatabaseIcon } from 'lucide-react';
import { AnimateOnScroll, StaggerContainer, StaggerItem } from './AnimateOnScroll';
export function Skills() {
  const skills = [{
    category: 'Frontend',
    items: ['HTML5', 'CSS3', 'JavaScript', 'TypeScript', 'React', 'Next.js', 'Tailwind CSS']
  }, {
    category: 'Backend',
    items: ['Python', 'Java', 'Flask', 'Django', 'RESTful APIs', 'GraphQL', 'Node.js']
  }, {
    category: 'Database',
    items: ['PostgreSQL', 'MySQL', 'SQLite']
  }, {
    category: 'Tools',
    items: ['Git', 'GitHub', 'GitHub Actions', 'Docker', 'VS Code', 'Jest']
  }];
  const skillIcons = {
    Frontend: <CodeIcon size={24} className="text-indigo-600 dark:text-indigo-400" />,
    Backend: <LayersIcon size={24} className="text-indigo-600 dark:text-indigo-400" />,
    Database: <DatabaseIcon size={24} className="text-indigo-600 dark:text-indigo-400" />,
    Tools: <PaletteIcon size={24} className="text-indigo-600 dark:text-indigo-400" />
  };
  return <section id="skills" className="py-20 bg-gray-50 dark:bg-gray-800 transition-colors duration-200">
      <div className="container mx-auto px-4">
        <AnimateOnScroll>
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-800 dark:text-white mb-4">
              Skills
            </h2>
            <div className="w-24 h-1 bg-indigo-600 dark:bg-indigo-500 mx-auto"></div>
            <p className="mt-4 text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              I've worked with a variety of technologies in the software
              development world. Here's an overview of my technical skills:
            </p>
          </div>
        </AnimateOnScroll>
        <StaggerContainer className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {skills.map((skillGroup, index) => <StaggerItem key={index}>
              <div className="bg-white dark:bg-gray-700 p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 h-full">
                <div className="flex items-center mb-4">
                  {skillIcons[skillGroup.category as keyof typeof skillIcons]}
                  <h3 className="text-xl font-bold text-gray-800 dark:text-white ml-2">
                    {skillGroup.category}
                  </h3>
                </div>
                <div className="flex flex-wrap gap-2">
                  {skillGroup.items.map((skill, idx) => <span key={idx} className="px-3 py-1 bg-gray-100 dark:bg-gray-600 text-gray-700 dark:text-gray-300 text-sm rounded-full">
                      {skill}
                    </span>)}
                </div>
              </div>
            </StaggerItem>)}
        </StaggerContainer>
      </div>
    </section>;
}
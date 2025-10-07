import React from 'react';
import { CalendarIcon, GraduationCapIcon, BriefcaseIcon } from 'lucide-react';
import { AnimateOnScroll, StaggerContainer, StaggerItem } from './AnimateOnScroll';
export function About() {
  return <section id="about" className="py-20 bg-white dark:bg-gray-900 transition-colors duration-200">
      <div className="container mx-auto px-4">
        <AnimateOnScroll>
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-800 dark:text-white mb-4">
              About Me
            </h2>
            <div className="w-24 h-1 bg-indigo-600 dark:bg-indigo-500 mx-auto"></div>
          </div>
        </AnimateOnScroll>
        <div className="flex flex-col md:flex-row gap-12 items-center">
          <AnimateOnScroll className="md:w-1/2" variants={{
          hidden: {
            opacity: 0,
            x: -50
          },
          visible: {
            opacity: 1,
            x: 0
          }
        }}>
            <h3 className="text-2xl font-bold text-gray-800 dark:text-white mb-4">
              My Story
            </h3>
            <p className="text-gray-600 dark:text-gray-300 mb-4">
              With over 2 years of professionall experience in software
              development, I specialize in creating modern and functional
              programs. My journey started at Harvard's CS50 class, and I've
              been coding ever since.
            </p>
            <p className="text-gray-600 dark:text-gray-300 mb-4">
              I'm currently focused on creating practical solutions for small
              businesses, such as an intelligent Ai powered WhatsApp assistant. My goal is to build tools that help people,
              generate impact, and strengthen my portfolio while growing
              professionally.
            </p>
            <p className="text-gray-600 dark:text-gray-300 mb-4">
              Outside of coding, I enjoy the gym, martial arts, gamer culture. I'm always exploring new technologies and ideas to push my
              skills further and turn them into useful, real-world projects.
            </p>
          </AnimateOnScroll>
          <AnimateOnScroll className="md:w-1/2" delay={0.2} variants={{
          hidden: {
            opacity: 0,
            x: 50
          },
          visible: {
            opacity: 1,
            x: 0
          }
        }}>
            <div className="bg-gray-50 dark:bg-gray-800 p-6 rounded-lg shadow-md">
              <StaggerContainer className="mb-6">
                <div className="flex items-center mb-2">
                  <BriefcaseIcon size={20} className="text-indigo-600 dark:text-indigo-400 mr-2" />
                  <h4 className="text-xl font-semibold text-gray-800 dark:text-white">
                    Experience
                  </h4>
                </div>
                <ul className="space-y-4">
                  <StaggerItem>
                    <div className="font-medium text-gray-800 dark:text-white">
                      TypeScript Developer
                    </div>
                    <div className="text-gray-600 dark:text-gray-400">
                      Bosch. Communications (2023 - 2024)
                    </div>
                  </StaggerItem>
                  <StaggerItem>
                    <div className="font-medium text-gray-800 dark:text-white">
                      Java Developer
                    </div>
                    <div className="text-gray-600 dark:text-gray-400">
                      Bosch. PowerTools. (2023)
                    </div>
                  </StaggerItem>
                </ul>
              </StaggerContainer>
              <StaggerContainer>
                <div className="flex items-center mb-2">
                  <GraduationCapIcon size={20} className="text-indigo-600 dark:text-indigo-400 mr-2" />
                  <h4 className="text-xl font-semibold text-gray-800 dark:text-white">
                    Education
                  </h4>
                </div>
                <ul className="space-y-4">
                  <StaggerItem>
                    <div className="font-medium text-gray-800 dark:text-white">
                      CS50
                    </div>
                    <div className="text-gray-600 dark:text-gray-400">
                      Harvard University (2025 - 2025)
                    </div>
                  </StaggerItem>
                  <StaggerItem>
                    <div className="font-medium text-gray-800 dark:text-white">
                      Several Certifications
                    </div>
                    <div className="text-gray-600 dark:text-gray-400">
                      Various (2020 - Present)
                    </div>
                  </StaggerItem>
                </ul>
              </StaggerContainer>
            </div>
          </AnimateOnScroll>
        </div>
      </div>
    </section>;
}
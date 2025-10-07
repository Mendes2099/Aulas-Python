import React, { useState } from 'react';
import { MapPinIcon, PhoneIcon, MailIcon, SendIcon } from 'lucide-react';
import { MeetingScheduler } from './MeetingScheduler';
import { AnimateOnScroll, StaggerContainer, StaggerItem } from './AnimateOnScroll';
import { motion } from 'framer-motion';
export function Contact() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    subject: '',
    message: ''
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submitMessage, setSubmitMessage] = useState('');
  const [submitStatus, setSubmitStatus] = useState('');
  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const {
      name,
      value
    } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    // Simulate form submission
    setTimeout(() => {
      setIsSubmitting(false);
      setSubmitStatus('success');
      setSubmitMessage('Thank you! Your message has been sent successfully.');
      setFormData({
        name: '',
        email: '',
        subject: '',
        message: ''
      });
    }, 1500);
  };
  return <section id="contact" className="py-20 bg-gray-50 dark:bg-gray-800 transition-colors duration-200">
      <div className="container mx-auto px-4">
        <AnimateOnScroll>
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-800 dark:text-white mb-4">
              Get In Touch
            </h2>
            <div className="w-24 h-1 bg-indigo-600 dark:bg-indigo-500 mx-auto"></div>
            <p className="mt-4 text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              Have a project in mind or want to collaborate? Feel free to reach
              out using the form below, schedule a meeting, or through my
              contact details.
            </p>
          </div>
        </AnimateOnScroll>
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <div className="space-y-8">
            <AnimateOnScroll variants={{
            hidden: {
              opacity: 0,
              y: 30
            },
            visible: {
              opacity: 1,
              y: 0
            }
          }}>
              <div className="bg-white dark:bg-gray-700 p-6 rounded-lg shadow-md">
                <div className="flex items-center mb-6">
                  <PhoneIcon size={24} className="text-indigo-600 dark:text-indigo-400 mr-2" />
                  <h3 className="text-xl font-bold text-gray-800 dark:text-white">
                    Contact Information
                  </h3>
                </div>
                <StaggerContainer className="space-y-6">
                  <StaggerItem>
                    <div className="flex items-start">
                      <div className="bg-indigo-100 dark:bg-indigo-900 p-3 rounded-full mr-4">
                        <MapPinIcon size={20} className="text-indigo-600 dark:text-indigo-400" />
                      </div>
                      <div>
                        <h4 className="font-medium text-gray-800 dark:text-white">
                          Location
                        </h4>
                        <p className="text-gray-600 dark:text-gray-300">
                          Porto, Portugal
                        </p>
                      </div>
                    </div>
                  </StaggerItem>
                  <StaggerItem>
                    <div className="flex items-start">
                      <div className="bg-indigo-100 dark:bg-indigo-900 p-3 rounded-full mr-4">
                        <MailIcon size={20} className="text-indigo-600 dark:text-indigo-400" />
                      </div>
                      <div>
                        <h4 className="font-medium text-gray-800 dark:text-white">
                          Email
                        </h4>
                        <a href="mailto:contact@example.com" className="text-indigo-600 dark:text-indigo-400 hover:underline">
                          mendes19966@gmail.com
                        </a>
                      </div>
                    </div>
                  </StaggerItem>
                  <StaggerItem>
                    <div className="flex items-start">
                      <div className="bg-indigo-100 dark:bg-indigo-900 p-3 rounded-full mr-4">
                        <PhoneIcon size={20} className="text-indigo-600 dark:text-indigo-400" />
                      </div>
                      <div>
                        <h4 className="font-medium text-gray-800 dark:text-white">
                          Phone
                        </h4>
                        <a href="tel:+11234567890" className="text-indigo-600 dark:text-indigo-400 hover:underline">
                          +351 915 474 777
                        </a>
                      </div>
                    </div>
                  </StaggerItem>
                </StaggerContainer>
              </div>
            </AnimateOnScroll>
            <AnimateOnScroll delay={0.2} variants={{
            hidden: {
              opacity: 0,
              y: 30
            },
            visible: {
              opacity: 1,
              y: 0
            }
          }}>
              <div className="bg-white dark:bg-gray-700 p-6 rounded-lg shadow-md">
                <div className="flex items-center mb-6">
                  <SendIcon size={24} className="text-indigo-600 dark:text-indigo-400 mr-2" />
                  <h3 className="text-xl font-bold text-gray-800 dark:text-white">
                    Send Me a Message
                  </h3>
                </div>
                <form onSubmit={handleSubmit}>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                    <div>
                      <label htmlFor="name" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                        Name
                      </label>
                      <input type="text" id="name" name="name" value={formData.name} onChange={handleChange} className="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 dark:bg-gray-800 dark:text-white" required />
                    </div>
                    <div>
                      <label htmlFor="email" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                        Email
                      </label>
                      <input type="email" id="email" name="email" value={formData.email} onChange={handleChange} className="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 dark:bg-gray-800 dark:text-white" required />
                    </div>
                  </div>
                  <div className="mb-4">
                    <label htmlFor="subject" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                      Subject
                    </label>
                    <input type="text" id="subject" name="subject" value={formData.subject} onChange={handleChange} className="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 dark:bg-gray-800 dark:text-white" required />
                  </div>
                  <div className="mb-6">
                    <label htmlFor="message" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                      Message
                    </label>
                    <textarea id="message" name="message" rows={4} value={formData.message} onChange={handleChange} className="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 dark:bg-gray-800 dark:text-white" required></textarea>
                  </div>
                  <motion.button type="submit" disabled={isSubmitting} className={`flex items-center justify-center px-6 py-3 bg-indigo-600 text-white font-medium rounded-md transition-colors duration-300 ${isSubmitting ? 'opacity-70 cursor-not-allowed' : 'hover:bg-indigo-700'}`} whileHover={{
                  scale: 1.03
                }} whileTap={{
                  scale: 0.97
                }}>
                    {isSubmitting ? <span>Sending...</span> : <>
                        <SendIcon size={18} className="mr-2" />
                        <span>Send Message</span>
                      </>}
                  </motion.button>
                  {submitMessage && <motion.div className={`mt-4 p-3 rounded-md ${submitStatus === 'success' ? 'bg-green-100 dark:bg-green-900 text-green-700 dark:text-green-300' : 'bg-red-100 dark:bg-red-900 text-red-700 dark:text-red-300'}`} initial={{
                  opacity: 0,
                  y: 10
                }} animate={{
                  opacity: 1,
                  y: 0
                }} transition={{
                  duration: 0.3
                }}>
                      {submitMessage}
                    </motion.div>}
                </form>
              </div>
            </AnimateOnScroll>
          </div>
          <AnimateOnScroll delay={0.3} variants={{
          hidden: {
            opacity: 0,
            y: 30
          },
          visible: {
            opacity: 1,
            y: 0
          }
        }}>
            <MeetingScheduler />
          </AnimateOnScroll>
        </div>
      </div>
    </section>;
}
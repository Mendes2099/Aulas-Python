import React, { useEffect, Children } from 'react';
import { motion, useAnimation, Variant } from 'framer-motion';
import { useInView } from 'react-intersection-observer';
interface AnimateOnScrollProps {
  children: ReactNode;
  threshold?: number;
  delay?: number;
  duration?: number;
  variants?: {
    hidden: Variant;
    visible: Variant;
  };
  className?: string;
}
export function AnimateOnScroll({
  children,
  threshold = 0.1,
  delay = 0,
  duration = 0.5,
  variants,
  className = ''
}: AnimateOnScrollProps) {
  const controls = useAnimation();
  const [ref, inView] = useInView({
    threshold,
    triggerOnce: true
  });
  const defaultVariants = {
    hidden: {
      opacity: 0,
      y: 30
    },
    visible: {
      opacity: 1,
      y: 0
    }
  };
  useEffect(() => {
    if (inView) {
      controls.start('visible');
    }
  }, [controls, inView]);
  return <motion.div ref={ref} initial="hidden" animate={controls} variants={variants || defaultVariants} transition={{
    duration,
    delay,
    ease: 'easeOut'
  }} className={className}>
      {children}
    </motion.div>;
}
export function StaggerContainer({
  children,
  className = '',
  staggerDelay = 0.1
}: {
  children: ReactNode;
  className?: string;
  staggerDelay?: number;
}) {
  const controls = useAnimation();
  const [ref, inView] = useInView({
    threshold: 0.1,
    triggerOnce: true
  });
  useEffect(() => {
    if (inView) {
      controls.start('visible');
    }
  }, [controls, inView]);
  return <motion.div ref={ref} className={className} initial="hidden" animate={controls} variants={{
    hidden: {},
    visible: {
      transition: {
        staggerChildren: staggerDelay
      }
    }
  }}>
      {children}
    </motion.div>;
}
export function StaggerItem({
  children,
  className = '',
  index = 0
}: {
  children: ReactNode;
  className?: string;
  index?: number;
}) {
  return <motion.div className={className} variants={{
    hidden: {
      opacity: 0,
      y: 20
    },
    visible: {
      opacity: 1,
      y: 0
    }
  }} transition={{
    duration: 0.5,
    ease: 'easeOut'
  }}>
      {children}
    </motion.div>;
}
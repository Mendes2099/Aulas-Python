import React, { useCallback, useEffect, useState } from 'react';
import { useTheme } from './ThemeProvider';
import Particles from 'react-tsparticles';
import { loadSlim } from '@tsparticles/slim';
import type { Engine } from '@tsparticles/engine';
export function AnimatedBackground() {
  const {
    theme
  } = useTheme();
  const [mounted, setMounted] = useState(false);
  useEffect(() => {
    setMounted(true);
  }, []);
  const particlesInit = useCallback(async (engine: Engine) => {
    await loadSlim(engine);
  }, []);
  if (!mounted) return null;
  return <div className="fixed inset-0 -z-10">
      <Particles id="tsparticles" init={particlesInit} options={{
      background: {
        color: {
          value: 'transparent'
        }
      },
      fpsLimit: 60,
      particles: {
        color: {
          value: theme === 'dark' ? '#6366f1' : '#4f46e5'
        },
        links: {
          color: theme === 'dark' ? '#6366f1' : '#4f46e5',
          distance: 150,
          enable: true,
          opacity: 0.2,
          width: 1
        },
        move: {
          direction: 'none',
          enable: true,
          outModes: {
            default: 'bounce'
          },
          random: false,
          speed: 1,
          straight: false
        },
        number: {
          density: {
            enable: true,
            area: 800
          },
          value: 80
        },
        opacity: {
          value: 0.3
        },
        shape: {
          type: 'circle'
        },
        size: {
          value: {
            min: 1,
            max: 3
          }
        }
      },
      detectRetina: true
    }} />
    </div>;
}
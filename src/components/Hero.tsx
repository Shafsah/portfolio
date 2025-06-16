import { ArrowDown, Github, Linkedin, Twitter } from 'lucide-react';
import { Link } from 'react-scroll';

const Hero = () => {
  return (
    <section id="hero" className="min-h-screen flex items-center relative overflow-hidden pt-20">
      <div className="absolute inset-0 bg-gradient-to-br from-primary-50 to-secondary-50 dark:from-gray-900 dark:to-gray-800 -z-10"></div>
      
      {/* Background Pattern/Decorations */}
      <div className="absolute top-20 right-0 w-72 h-72 bg-primary-300/20 dark:bg-primary-900/20 rounded-full filter blur-3xl -z-10"></div>
      <div className="absolute bottom-20 left-0 w-72 h-72 bg-secondary-300/20 dark:bg-secondary-900/20 rounded-full filter blur-3xl -z-10"></div>
      
      <div className="container mx-auto px-4">
        <div className="max-w-3xl">
          <div className="animate-fade-in">
            <span className="text-sm md:text-base font-medium text-primary-600 dark:text-primary-400 uppercase tracking-wider">
              Flutter Developer
            </span>
            
            <h1 className="mt-2 mb-6 font-bold leading-tight">
              Hi, I'm <span className="text-primary-600 dark:text-primary-500">Syeda Hafsa Shah</span>
              <br />
              I build amazing mobile apps
            </h1>
            
            <p className="text-lg md:text-xl text-gray-700 dark:text-gray-300 mb-8 max-w-2xl">
              I'm a passionate Flutter developer creating beautiful, high-performance 
              mobile applications. Specializing in cross-platform development and 
              delivering exceptional user experiences.
            </p>
            
            <div className="flex flex-wrap gap-4">
              <a href="#projects" className="btn btn-primary">
                View My Work
              </a>
              <a href="/resume.pdf" className="btn btn-outline" download>
                Download CV
              </a>
            </div>
            
            <div className="mt-10 flex space-x-6">
              <a 
                href="https://github.com/yourusername" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-gray-600 hover:text-primary-600 dark:text-gray-400 dark:hover:text-primary-500 transition-colors"
                aria-label="GitHub"
              >
                <Github size={24} />
              </a>
              <a 
                href="https://linkedin.com/in/yourusername" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-gray-600 hover:text-primary-600 dark:text-gray-400 dark:hover:text-primary-500 transition-colors"
                aria-label="LinkedIn"
              >
                <Linkedin size={24} />
              </a>
              <a 
                href="https://twitter.com/yourusername" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-gray-600 hover:text-primary-600 dark:text-gray-400 dark:hover:text-primary-500 transition-colors"
                aria-label="Twitter"
              >
                <Twitter size={24} />
              </a>
            </div>
          </div>
        </div>
      </div>
      
      {/* Scroll Down Indicator */}
      <div className="absolute bottom-10 left-1/2 transform -translate-x-1/2 animate-bounce">
        <Link
          to="about"
          spy={true}
          smooth={true}
          offset={-70}
          duration={500}
          className="flex flex-col items-center cursor-pointer text-gray-600 dark:text-gray-400 hover:text-primary-600 dark:hover:text-primary-400 transition-colors"
        >
          <span className="text-sm mb-2">Scroll Down</span>
          <ArrowDown size={20} />
        </Link>
      </div>
    </section>
  );
};

export default Hero;
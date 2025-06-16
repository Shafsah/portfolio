import { useState, useEffect } from 'react';
import { Link as ScrollLink } from 'react-scroll';
import { Menu, X, Code } from 'lucide-react';

interface HeaderProps {
  theme: 'light' | 'dark';
}

const Header = ({ theme }: HeaderProps) => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  const navItems = [
    { name: 'Home', to: 'hero' },
    { name: 'About', to: 'about' },
    { name: 'Projects', to: 'projects' },
    { name: 'Skills', to: 'skills' },
    { name: 'Contact', to: 'contact' },
  ];

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 20) {
        setScrolled(true);
      } else {
        setScrolled(false);
      }
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <header
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
        scrolled
          ? 'bg-white/90 dark:bg-gray-900/90 backdrop-blur-md shadow-md py-3'
          : 'bg-transparent py-5'
      }`}
    >
      <div className="container mx-auto px-4 flex justify-between items-center">
        <a href="#" className="flex items-center space-x-2">
          <Code 
            size={32} 
            className={`transition-colors ${
              theme === 'dark' ? 'text-primary-500' : 'text-primary-600'
            }`} 
          />
          <span className="font-heading font-bold text-xl">Syeda Hafsa Shah</span>
        </a>

        {/* Desktop Navigation */}
        <nav className="hidden md:flex space-x-8">
          {navItems.map((item) => (
            <ScrollLink
              key={item.name}
              to={item.to}
              spy={true}
              smooth={true}
              offset={-70}
              duration={500}
              className={`font-medium cursor-pointer transition-colors hover:text-primary-600 dark:hover:text-primary-400 ${
                scrolled ? 'text-gray-900 dark:text-gray-100' : 'text-gray-900 dark:text-gray-100'
              }`}
            >
              {item.name}
            </ScrollLink>
          ))}
        </nav>

        {/* Mobile Menu Button */}
        <button
          className="md:hidden text-gray-700 dark:text-gray-300"
          onClick={() => setIsMenuOpen(!isMenuOpen)}
          aria-label="Toggle menu"
        >
          {isMenuOpen ? <X size={24} /> : <Menu size={24} />}
        </button>
      </div>

      {/* Mobile Navigation */}
      {isMenuOpen && (
        <nav className="md:hidden py-4 px-6 bg-white dark:bg-gray-800 shadow-lg animate-slide-down">
          <div className="flex flex-col space-y-4">
            {navItems.map((item) => (
              <ScrollLink
                key={item.name}
                to={item.to}
                spy={true}
                smooth={true}
                offset={-70}
                duration={500}
                className="font-medium py-2 cursor-pointer transition-colors hover:text-primary-600 dark:hover:text-primary-400"
                onClick={() => setIsMenuOpen(false)}
              >
                {item.name}
              </ScrollLink>
            ))}
          </div>
        </nav>
      )}
    </header>
  );
};

export default Header;
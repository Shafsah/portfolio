import { useState } from 'react';
import { ExternalLink, Github, ArrowRight } from 'lucide-react';

// Project data
const projectsData = [
  {
    id: 1,
    title: 'Health & Fitness App',
    description:
      'A comprehensive fitness tracking app with workout plans, nutrition tracking, and social features. Built with Flutter and Firebase.',
    image: 'https://images.pexels.com/photos/4498606/pexels-photo-4498606.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    tags: ['Flutter', 'Firebase', 'BLoC', 'Google Fit API'],
    liveLink: 'https://play.google.com/store',
    repoLink: 'https://github.com/username/fitness-app',
    featured: true,
  },
  {
    id: 2,
    title: 'E-Commerce Mobile App',
    description:
      'Feature-rich e-commerce application with real-time inventory, secure payments, and personalized recommendations.',
    image: 'https://images.pexels.com/photos/230544/pexels-photo-230544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    tags: ['Flutter', 'Stripe', 'GetX', 'REST API'],
    liveLink: 'https://apps.apple.com/us/app',
    repoLink: 'https://github.com/username/ecommerce-app',
    featured: true,
  },
  {
    id: 3,
    title: 'Social Media App',
    description:
      'Modern social networking app with real-time messaging, story sharing, and content discovery features.',
    image: 'https://images.pexels.com/photos/3850262/pexels-photo-3850262.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    tags: ['Flutter', 'Socket.io', 'Provider', 'MongoDB'],
    liveLink: 'https://play.google.com/store',
    repoLink: 'https://github.com/username/social-app',
    featured: false,
  },
  {
    id: 4,
    title: 'Food Delivery App',
    description:
      'Restaurant delivery app with real-time order tracking, payment integration, and driver management system.',
    image: 'https://images.pexels.com/photos/6963098/pexels-photo-6963098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    tags: ['Flutter', 'Google Maps', 'Riverpod', 'Node.js'],
    liveLink: 'https://apps.apple.com/us/app',
    repoLink: 'https://github.com/username/delivery-app',
    featured: false,
  },
];

const Projects = () => {
  const [filter, setFilter] = useState('all');
  
  const filteredProjects = filter === 'featured' 
    ? projectsData.filter(project => project.featured) 
    : projectsData;

  return (
    <section id="projects" className="py-20 bg-gray-50 dark:bg-gray-900">
      <div className="container mx-auto px-4">
        <div className="section-heading">
          <h2 className="section-title">My Projects</h2>
          <p className="section-subtitle">
            A showcase of my mobile development work using Flutter
          </p>
          
          <div className="flex justify-center mt-8 space-x-4">
            <button
              className={`px-4 py-2 rounded-lg transition-colors ${
                filter === 'all'
                  ? 'bg-primary-600 text-white'
                  : 'bg-gray-200 text-gray-800 dark:bg-gray-700 dark:text-gray-200 hover:bg-gray-300 dark:hover:bg-gray-600'
              }`}
              onClick={() => setFilter('all')}
            >
              All Projects
            </button>
            <button
              className={`px-4 py-2 rounded-lg transition-colors ${
                filter === 'featured'
                  ? 'bg-primary-600 text-white'
                  : 'bg-gray-200 text-gray-800 dark:bg-gray-700 dark:text-gray-200 hover:bg-gray-300 dark:hover:bg-gray-600'
              }`}
              onClick={() => setFilter('featured')}
            >
              Featured Projects
            </button>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
          {filteredProjects.map((project, index) => (
            <div 
              key={project.id}
              className="card group hover:translate-y-[-5px] animate-slide-up"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <div className="relative overflow-hidden h-60">
                <img
                  src={project.image}
                  alt={project.title}
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end">
                  <div className="p-6 w-full flex justify-between items-center">
                    <div className="flex space-x-4">
                      <a
                        href={project.liveLink}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-white hover:text-primary-400 transition-colors"
                        aria-label="Live Demo"
                      >
                        <ExternalLink size={20} />
                      </a>
                      <a
                        href={project.repoLink}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-white hover:text-primary-400 transition-colors"
                        aria-label="GitHub Repository"
                      >
                        <Github size={20} />
                      </a>
                    </div>
                    <a
                      href={project.liveLink}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-white hover:text-primary-400 transition-colors text-sm flex items-center"
                    >
                      View Project <ArrowRight size={16} className="ml-1" />
                    </a>
                  </div>
                </div>
              </div>
              <div className="p-6">
                <h3 className="text-xl font-bold mb-2">{project.title}</h3>
                <p className="text-gray-600 dark:text-gray-300 mb-4">
                  {project.description}
                </p>
                <div className="flex flex-wrap gap-2 mt-4">
                  {project.tags.map((tag) => (
                    <span
                      key={tag}
                      className="px-3 py-1 text-xs font-medium bg-gray-100 dark:bg-gray-700 rounded-full text-gray-800 dark:text-gray-200"
                    >
                      {tag}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          ))}
        </div>
        
        <div className="text-center mt-12">
          <a 
            href="https://github.com/username" 
            target="_blank" 
            rel="noopener noreferrer"
            className="btn btn-outline inline-flex items-center"
          >
            See More Projects
            <ArrowRight size={16} className="ml-2" />
          </a>
        </div>
      </div>
    </section>
  );
};

export default Projects;
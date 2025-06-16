import { CheckCircle, Calendar, Briefcase, GraduationCap } from 'lucide-react';

const About = () => {
  return (
    <section id="about" className="py-20 bg-white dark:bg-gray-800">
      <div className="container mx-auto px-4">
        <div className="section-heading">
          <h2 className="section-title">About Me</h2>
          <p className="section-subtitle">
            Here you'll find more information about me, what I do, and my current skills
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 mt-12">
          <div className="animate-slide-up">
            <h3 className="text-2xl font-bold mb-4 text-primary-600 dark:text-primary-500">
              Get to know me!
            </h3>
            
            <div className="space-y-4 text-gray-700 dark:text-gray-300">
              <p>
                I'm a <strong>Flutter Developer</strong> specializing in building beautiful, 
                performant mobile applications that deliver exceptional user experiences. 
                Check out some of my work in the Projects section.
              </p>
              
              <p>
                I'm passionate about mobile development and enjoy sharing my knowledge 
                about Flutter and Dart through technical articles and open-source contributions.
              </p>
              
              <p>
                I'm open to Flutter development opportunities where I can contribute, learn 
                and grow. If you have an exciting mobile project that matches my skills and 
                experience, don't hesitate to contact me.
              </p>
            </div>
            
            <div className="mt-8">
              <a href="#contact" className="btn btn-primary">
                Contact Me
              </a>
            </div>
          </div>
          
          <div className="animate-slide-up" style={{ animationDelay: '0.2s' }}>
            <h3 className="text-2xl font-bold mb-4 text-primary-600 dark:text-primary-500">
              My Experience
            </h3>
            
            <div className="space-y-6">
              <div className="flex">
                <div className="mr-4">
                  <Briefcase className="text-primary-600 dark:text-primary-400" size={24} />
                </div>
                <div>
                  <h4 className="text-xl font-bold">Senior Flutter Developer</h4>
                  <p className="text-gray-600 dark:text-gray-400">Mobile Innovation Labs</p>
                  <div className="flex items-center mt-1 text-sm text-gray-500 dark:text-gray-400">
                    <Calendar size={16} className="mr-1" />
                    <span>2021 - Present</span>
                  </div>
                  <ul className="mt-2 space-y-1">
                    <li className="flex items-start">
                      <CheckCircle size={16} className="text-secondary-500 mt-1 mr-2 flex-shrink-0" />
                      <span>Led development of multiple successful Flutter applications</span>
                    </li>
                    <li className="flex items-start">
                      <CheckCircle size={16} className="text-secondary-500 mt-1 mr-2 flex-shrink-0" />
                      <span>Implemented complex state management solutions using BLoC</span>
                    </li>
                  </ul>
                </div>
              </div>
              
              <div className="flex">
                <div className="mr-4">
                  <Briefcase className="text-primary-600 dark:text-primary-400" size={24} />
                </div>
                <div>
                  <h4 className="text-xl font-bold">Mobile App Developer</h4>
                  <p className="text-gray-600 dark:text-gray-400">Tech Startups Inc.</p>
                  <div className="flex items-center mt-1 text-sm text-gray-500 dark:text-gray-400">
                    <Calendar size={16} className="mr-1" />
                    <span>2019 - 2021</span>
                  </div>
                  <ul className="mt-2 space-y-1">
                    <li className="flex items-start">
                      <CheckCircle size={16} className="text-secondary-500 mt-1 mr-2 flex-shrink-0" />
                      <span>Developed cross-platform mobile apps using Flutter</span>
                    </li>
                    <li className="flex items-start">
                      <CheckCircle size={16} className="text-secondary-500 mt-1 mr-2 flex-shrink-0" />
                      <span>Integrated Firebase services and RESTful APIs</span>
                    </li>
                  </ul>
                </div>
              </div>
              
              <div className="flex">
                <div className="mr-4">
                  <GraduationCap className="text-primary-600 dark:text-primary-400" size={24} />
                </div>
                <div>
                  <h4 className="text-xl font-bold">B.S. Computer Science</h4>
                  <p className="text-gray-600 dark:text-gray-400">Mobile Technology Institute</p>
                  <div className="flex items-center mt-1 text-sm text-gray-500 dark:text-gray-400">
                    <Calendar size={16} className="mr-1" />
                    <span>2015 - 2019</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default About;
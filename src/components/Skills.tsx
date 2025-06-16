import { Code, Database, Layers, Globe, Server, Workflow, PenTool as Tool, Palette } from 'lucide-react';

const skillsData = {
  mobile: [
    'Flutter',
    'Dart',
    'BLoC',
    'Provider',
    'GetX',
    'Riverpod',
    'Firebase',
    'REST APIs',
    'SQLite',
    'Hive',
  ],
  ui: [
    'Material Design',
    'Cupertino',
    'Custom Widgets',
    'Animations',
    'Responsive Design',
    'UI/UX Design',
    'Prototyping',
    'Figma',
  ],
  backend: [
    'Node.js',
    'Express',
    'MongoDB',
    'PostgreSQL',
    'Firebase',
    'REST APIs',
    'GraphQL',
    'WebSockets',
  ],
  devOps: [
    'Git',
    'GitHub Actions',
    'CI/CD',
    'Docker',
    'AWS',
    'Google Cloud',
    'App Store Connect',
    'Google Play Console',
  ],
  tools: [
    'VS Code',
    'Android Studio',
    'Xcode',
    'Postman',
    'Firebase Console',
    'Flutter DevTools',
    'Codemagic',
    'Fastlane',
  ],
};

const SkillCategory = ({ 
  title, 
  skills, 
  icon: Icon, 
  color, 
  delay = 0 
}: { 
  title: string; 
  skills: string[]; 
  icon: React.ElementType; 
  color: string; 
  delay?: number;
}) => {
  return (
    <div 
      className="card p-6 animate-slide-up" 
      style={{ animationDelay: `${delay}s` }}
    >
      <div className="flex items-center mb-6">
        <div className={`p-3 rounded-lg ${color} mr-4`}>
          <Icon size={24} className="text-white" />
        </div>
        <h3 className="text-xl font-bold">{title}</h3>
      </div>
      
      <div className="flex flex-wrap gap-2">
        {skills.map((skill) => (
          <span
            key={skill}
            className="px-3 py-1 bg-gray-100 dark:bg-gray-700 rounded-full text-sm"
          >
            {skill}
          </span>
        ))}
      </div>
    </div>
  );
};

const Skills = () => {
  return (
    <section id="skills" className="py-20 bg-white dark:bg-gray-800">
      <div className="container mx-auto px-4">
        <div className="section-heading">
          <h2 className="section-title">My Skills</h2>
          <p className="section-subtitle">
            A comprehensive list of my technical skills and expertise in mobile development
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mt-12">
          <SkillCategory
            title="Mobile Development"
            skills={skillsData.mobile}
            icon={Globe}
            color="bg-primary-600"
            delay={0}
          />
          
          <SkillCategory
            title="UI Development"
            skills={skillsData.ui}
            icon={Palette}
            color="bg-secondary-600"
            delay={0.1}
          />
          
          <SkillCategory
            title="Backend Development"
            skills={skillsData.backend}
            icon={Server}
            color="bg-accent-600"
            delay={0.2}
          />
          
          <SkillCategory
            title="DevOps"
            skills={skillsData.devOps}
            icon={Workflow}
            color="bg-green-600"
            delay={0.3}
          />
          
          <SkillCategory
            title="Tools & Software"
            skills={skillsData.tools}
            icon={Tool}
            color="bg-purple-600"
            delay={0.4}
          />
        </div>

        <div className="mt-16 bg-gradient-to-r from-primary-100 to-secondary-100 dark:from-primary-900/30 dark:to-secondary-900/30 rounded-xl p-8 animate-fade-in">
          <div className="flex flex-col md:flex-row items-center">
            <div className="md:w-3/5 md:pr-8">
              <h3 className="text-2xl font-bold mb-4">My Development Process</h3>
              <p className="text-gray-700 dark:text-gray-300 mb-6">
                I follow a systematic approach to mobile app development that ensures 
                high-quality, performant, and user-friendly applications. My process 
                includes thorough planning, iterative development, comprehensive testing, 
                and continuous deployment.
              </p>
              
              <div className="grid grid-cols-2 gap-4">
                <div className="flex items-start">
                  <div className="p-2 bg-primary-100 dark:bg-primary-900/50 rounded-lg mr-3">
                    <Layers size={20} className="text-primary-600 dark:text-primary-400" />
                  </div>
                  <div>
                    <h4 className="font-bold">Clean Architecture</h4>
                    <p className="text-sm text-gray-600 dark:text-gray-400">Maintainable code</p>
                  </div>
                </div>
                
                <div className="flex items-start">
                  <div className="p-2 bg-primary-100 dark:bg-primary-900/50 rounded-lg mr-3">
                    <Code size={20} className="text-primary-600 dark:text-primary-400" />
                  </div>
                  <div>
                    <h4 className="font-bold">Best Practices</h4>
                    <p className="text-sm text-gray-600 dark:text-gray-400">Flutter standards</p>
                  </div>
                </div>
                
                <div className="flex items-start">
                  <div className="p-2 bg-primary-100 dark:bg-primary-900/50 rounded-lg mr-3">
                    <Palette size={20} className="text-primary-600 dark:text-primary-400" />
                  </div>
                  <div>
                    <h4 className="font-bold">UI/UX Focus</h4>
                    <p className="text-sm text-gray-600 dark:text-gray-400">Beautiful interfaces</p>
                  </div>
                </div>
                
                <div className="flex items-start">
                  <div className="p-2 bg-primary-100 dark:bg-primary-900/50 rounded-lg mr-3">
                    <Tool size={20} className="text-primary-600 dark:text-primary-400" />
                  </div>
                  <div>
                    <h4 className="font-bold">Testing</h4>
                    <p className="text-sm text-gray-600 dark:text-gray-400">Quality assurance</p>
                  </div>
                </div>
              </div>
            </div>
            
            <div className="md:w-2/5 mt-8 md:mt-0">
              <div className="relative h-60 md:h-72 w-full rounded-xl overflow-hidden">
                <img 
                  src="https://images.pexels.com/photos/3861958/pexels-photo-3861958.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" 
                  alt="Development Process" 
                  className="w-full h-full object-cover"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-primary-900/70 to-transparent flex items-end">
                  <div className="p-4 text-white">
                    <h4 className="font-bold text-lg">Flutter Development</h4>
                    <p className="text-sm">Building beautiful cross-platform apps</p>
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

export default Skills;
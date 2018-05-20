# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
q=Question.new
q.title= "Personal Growth & Ambition Mindset"
q.q1= "You are frightened by changes and prefer things to stay as they currently are. You are not interested in change or growth."
q.q2= "You are starting to understand the possibilities of growth in all areas of your life, though you feel stuck."
q.q3= "You've experienced an acceptable status level, & wish to maintain this level. You're not interested in further growth requiring more effort."
q.q4= "You always look for ways to grow and people who can help you become a better version of yourself. You may have a Business/Life Coach"
q.save

q=Question.new
q.title= "CEO Mindset"
q.q1= "You feel your company should provide direction for your business future & you depend on their support to determine your success."
q.q2= "You understand the concepts of being self-made and try to align with a company that will help support your desired growth."
q.q3= "You work to improve your skills, but feel your company/manager should be responsible to provide the tools needed to succeed."
q.q4= "You treat your business like \"You, Inc.\" You have marketing/business plans & you do not rely on others to invest in your success."
q.save

q=Question.new
q.title= "Sense of Urgency"
q.q1= "You are afraid of doing things that others may perceive as \"pushy\" & you tend to let life happen at its own pace & aren't quick to act."
q.q2= "You are beginning to realize that you need to act quickly to seize opportunities in your life, yet you don't know how to do it."
q.q3= "You find there are times when you have acted quickly & it has helped you and others, yet you find it hard to do when the stakes are highest."
q.q4= "Your belief is that things need to happen right now before something changes and you relentlessly encourage others to move now."
q.save

q=Question.new
q.title= "Your Team"
q.q1= "You do not see the benefit in adding a member to your team, or you would not want the responsibility."
q.q2= "You feel an assistant or partner could be helpful, but you haven't figured out how to fund them or how they would fit into your system."
q.q3= "You have at least 1 other member on your team and you have clearly defined roles for each person."
q.q4= "You have a full production team that predictably generates business whether you are in the office or not. Each member knows their role."
q.save

q=Question.new
q.title= "Systematic & Proactive"
q.q1= "You start each day without a plan. You are best at winging it."
q.q2= "Most of your day is spent reacting to phone calls and emails. Your best intentions sometimes take the back seat to the crisis of the moment."
q.q3= "You have created systems that limit crisis management, giving you more time to prospect for new business."
q.q4= "You map out your days which keeps you focused on business generating activities regardless of what's going on around you."
q.save

q=Question.new
q.title= "Production Results"
q.q1= "Your average 12 Month Productions is: Less than 5 loans per month."
q.q2= "Your average 12 Month Productions is: 6-10 loans per month."
q.q3= "Your average 12 Month Productions is: 10-20  loans per month."
q.q4= "Your average 12 Month Productions is: 21+ loans per month."
q.save

q=Question.new
q.title= "Competitive Mindset"
q.q1= "You feel competition is only for athletes and do not care about how you rank amongst your peers."
q.q2= "You want to win personally & professionally in all areas of your life but aren't sure how to succeed."
q.q3= "You like to win at the things you deem important and feel the effort is more important than the results."
q.q4= "You want to win at everything you do and you are willing to put forth whatever effort is needed to guarantee victory."
q.save

q=Question.new
q.title= "Industry Lifestyle"
q.q1= "You feel you should always separate business & pleasure, & treat each closing as a business transaction."
q.q2= "You'd like to find others with your same mindset to collaborate with but aren't sure where to find these groups to reach out."
q.q3= "You go to industry events and enjoy socializing at these events but prefer not talking shop during your personal time."
q.q4= "You enjoy talking shop with friends, family & clients. You don't consider it \"work\". Hanging out with others in \"Biz\" is fun, like a hobby."
q.save

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


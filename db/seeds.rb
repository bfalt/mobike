
require 'faker'
require "open-uri"

Motorbike.destroy_all
User.destroy_all

User.create(email: "dev@email.com", password: "password", admin: true)
10.times do
  user = User.create(email: Faker::Internet.email, password: "password")
end



motorbikes = [
  {
    image_url: ["https://images.pexels.com/photos/39693/motorcycle-racer-racing-race-speed-39693.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", "https://images.unsplash.com/photo-1529946607596-ce8147321723?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"],
    name: 'Superfast R1',
    year: '2020',
    make: 'Yamaha',
    model: 'R1',
    description: 'The engine\'s torque and power delivery are unmistakable, with the four catalysers doing little to mute the MotoGP exhaust note!',
    address: 'London, UK',
    price: 100
  },

   {
    image_url: ["https://images.pexels.com/photos/1309668/pexels-photo-1309668.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://i.pinimg.com/originals/cd/a7/88/cda788ea03af41319dd359f5f83359e4.jpg"],
    name: 'Fun Ducati!',
    year: '2017',
    make: 'Ducati',
    model: 'Streetfighter 1098s',
    description: 'Ducati claim it’s the lightest bike in the class, at 167kg (17kg lighter than the S4Rs it replaces) and it’s also the most powerful Ducati naked bike ever made. It’s a liquid-cooled, 155bhp V-twin bruiser that uses a hybrid 1098/1198 motor, a modified frame for more stability and a slightly longer swingarm. Think of it a cross between a big supermoto and a Monster and you’ll be on the right track!',
    address: 'Amsterdan, Netherlands',
    price: 170
  },

  {
    image_url: ["https://psmfirestorm.blob.core.windows.net/crs-images/210557/7987/original.jpg", "https://images.pexels.com/photos/595807/pexels-photo-595807.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://cdn.dealerspike.com/imglib/v1/800x600/imglib/Assets/Inventory/EE/F2/EEF298CC-1375-4E43-A599-C33433D9A896.jpg"],
    name: 'Ninja Power!',
    year: '2018',
    make: 'Kawasaki',
    model: 'Ninja 650',
    description: 'Reinvigorated to further embody Ninja® sportbike lineage, the new 2020 Ninja® 650 motorcycle comes packed with a sporty 649cc engine, next-level technology advancements and sharp styling updates. Unmistakable sport performance is met with an upright riding position for exciting daily commutes, while a supreme level of attitude reminds you of its legendary heritage.',
    address: 'Delft, Netherlands',
    price: 125
  },

  {
    image_url: ["https://bd.gaadicdn.com/processedimages/triumph/rocket-3/source/v_rocket-3-std1564575462.jpg?tr=h-48", "https://img.drivemag.net/media/default/0001/97/Triumph-Rocket-III-2-9011-default-large.jpeg"],
    name: 'Englands Finest!',
    year: '2020',
    make: 'Triumph',
    model: 'Rocket',
    description: 'A genuine motorcycle legend, the original Triumph Rocket was a pure original equipped with the world’s largest production motorbike engine and more muscle and presence than all others. The next chapter in this incredible story was introduced with an all-new Rocket TFC, which once again tore up the rule book and set a whole new benchmark for torque, performance, capability and style.',
    address: 'Munich, Germany',
    price: 200
  },

  {
    image_url: ["https://images.unsplash.com/photo-1558981001-5864b3250a69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1558980394-4c7c9299fe96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://stat.overdrive.in/wp-content/odgallery/2017/10/39047_harley-davidson_fat_boy_1.jpg"],
    name: 'Murica!!!',
    year: '2020',
    make: 'Harley Davidson',
    model: 'Fat Boy',
    description: 'Act like a tough guy, ride this bike.',
    address: 'Berlin, Germany',
    price: 210
  },

  {
    image_url: ["https://imgd.aeplcdn.com/1280x720/bw/models/ducati-panigale-v4-r.jpg?20190103151915, https://cdn1-production-images-kly.akamaized.net/wxhV2fOpcwWcZp4ZxsytrD6BzZk=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2762495/original/019051800_1553678447-2019_Ducati_Panigale_V4_R_Motorcycle.jpg, https://cdn-1.motorsport.com/images/mgl/2wBz1pB0/s8/ducati-panigale-v4r-1.jpg, https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"],
    name: 'Italys finest!',
    year: '2020',
    make: 'Ducati',
    model: 'Panigale V4R',
    description: 'Are you single? Wish you had a girlfriend? Trust me. Rent this bike and you wont be single for long! You know you want to ride this bike. Do yourself a favor and rent this beauty!!!',
    address: 'Milan, Italy',
    price: 250
  },

  {
    image_url: ["https://cdn.dealerspike.com/imglib/v1/800x600/imglib/Assets/Inventory/32/D9/32D9E6C0-93C4-4E7E-BE7A-D95F8E08C285.jpg" , "https://images.unsplash.com/photo-1572506745854-299ae0b55400?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"],
    name: 'Another ok piece of British Engineering.',
    year: '2014',
    make: 'Triumph',
    model: 'Street Triple',
    description: 'Comfortable, fun. Good for old and young alike.',
    address: 'Utrecht, Netherlands',
    price: 90
  },

  {
    image_url: ["https://images.unsplash.com/photo-1580310390364-19360356c52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1580310614729-ccd69652491d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" "https://images.unsplash.com/flagged/photo-1563806164183-25d492848b25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"],
    name: 'Little Ninja Power!',
    year: '2017',
    make: 'Kawasaki',
    model: 'Ninja 300',
    description: 'Lots of get up and go! Not a crazy high top speed, but hey, who really needs to go 200k per hour?',
    address: 'Rotterdam, Netherlands',
    price: 105
  },

  {
    image_url: ["https://images.pexels.com/photos/2611686/pexels-photo-2611686.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"],
    name: 'A hardtail you want',
    year: '2009',
    make: 'Harley Davidson',
    model: 'Sportster Springer',
    description: 'Uncomfortable, yet fun.',
    address: 'Brugge, Belgium',
    price: 190
  },

  {
    image_url: ["https://stat.overdrive.in/wp-content/odgallery/2019/06/52784_BMWS1000RR_014_jk.jpg", "https://auto.ndtvimg.com/bike-images/large/bmw/s-1000-rr/bmw-s-1000-rr.webp?v=7"],
    name: 'Lets get some speeding tickets!',
    year: '2019',
    make: 'BMW',
    model: 'S 1000 RR',
    description: 'Screamin fast. For those who want to drop a knee...BMW S1000RR is a race oriented sport bike initially made by BMW Motorrad to compete in the 2009 Superbike World Championship, that is now in commercial production. It was introduced in Munich in April 2008, and is powered by a 999 cc four-cylinder engine redlined at 14,200 rpm.',
    address: 'Brussels, Belgium',
    price: 250
  },

  {
    image_url: ["https://images.pexels.com/photos/2549942/pexels-photo-2549942.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://images.pexels.com/photos/3378437/pexels-photo-3378437.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/34006/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"],
    name: 'Old School',
    year: '2017',
    make: 'Yamaha',
    model: 'Cafe Racer',
    description: 'Perfect for those hipsters among us. Yamaha’s first motorcycle appeared in 1955. The 125cc two-stroke YA-1 went straight to the racetrack and started winning titles. Yamaha has built on those race credentials over the years, winning at the IOM TT and the Paris Dakar. Yamaha continues to run a successful factory race team in Moto GP. Yamaha’s contribution to the custom motorcycle world includes the highly successful and long loved SR400 and SR500 singles we see in so many café racer builds. Other Yamaha custom favourites include the seventies XS650 twins and more recently their XSR700 and XSR900 Sport Heritage range.',
    address: 'Nice, France',
    price: 130
  },


  {
    image_url: ["https://images.pexels.com/photos/163210/motorcycles-race-helmets-pilots-163210.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://www.aprilia.com/assets/aprilia-sites/master/models/moto/road/RSV4-1100-FACTORY/main/2020/RSV4-Factory-1100-My20/original/RSV4-Factory-1100-My20.jpg"],
    name: 'Old School',
    year: '2020',
    make: 'Aprilla',
    model: 'RSV4 1100 Factory',
    description: 'The RSV4 project has always pursued a stated goal: to be the absolute best and fastest uncompromising superbike, the closest to Aprilia racing bikes in terms of performance and effectiveness. A premium product at the top of its category, dedicated to extremely demanding customers who want top shelf performance and refined technical equipment.',
    price: 330
  },


  {
    image_url: ["https://images.unsplash.com/photo-1574313007729-055d09a7ce85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80", "https://images.unsplash.com/photo-1529946607596-ce8147321723?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80https://i.pinimg.com/originals/cd/a7/88/cda788ea03af41319dd359f5f83359e4.jpg"],
    name: 'Superfast R1',
    year: '2020',
    make: 'Yamaha',
    model: 'R1',
    description: 'The Yamaha YZF-R1, or R1, is an open class sport bike, or superbike, motorcycle made by Yamaha from 1998 through the current 2020 model year.',
    address: 'London, UK',
    price: 100
  },

  {
    image_url: ["https://images.pexels.com/photos/1309668/pexels-photo-1309668.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"],
    name: 'Fun Ducati!',
    year: '2017',
    make: 'Ducati',
    model: 'Streetfighter 1098s',
    description: 'Very very nice!',
    address: 'Amsterdan, Netherlands',
    price: 170
  },

  {
    image_url: ["https://images.pexels.com/photos/595807/pexels-photo-595807.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://psmfirestorm.blob.core.windows.net/crs-images/210557/7987/original.jpg"],
    name: 'Nimble and Fast!!!!',
    year: '2018',
    make: 'Kawasaki',
    model: 'Ninja 650',
    description: 'Reinvigorated to further embody Ninja® sportbike lineage, the new 2020 Ninja® 650 motorcycle comes packed with a sporty 649cc engine, next-level technology advancements and sharp styling updates. Unmistakable sport performance is met with an upright riding position for exciting daily commutes, while a supreme level of attitude reminds you of its legendary heritage.',
    address: 'Delft, Netherlands',
    price: 125
  },
]




motorbikes.each do |motorbike_hash|
  new_motorbike = Motorbike.new(name: motorbike_hash[:name], year: motorbike_hash[:year], make: motorbike_hash[:make], model: motorbike_hash[:model], description: motorbike_hash[:description], address: motorbike_hash[:address],price: motorbike_hash[:price] )
  new_motorbike.user = User.all.sample

  motorbike_hash[:image_url].each do |img_url|
    p img_url
    file = URI.open(img_url)
    new_motorbike.photos.attach(io: file, filename: "#{motorbike_hash[:name]}.jpg", content_type: 'image/jpg')
  end
  new_motorbike.save
  puts "Motorbike created!"
end



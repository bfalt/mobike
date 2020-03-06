
require 'faker'
require "open-uri"

Review.destroy_all
Booking.destroy_all
Motorbike.destroy_all
User.destroy_all

User.create(email: "dev@email.com", password: "password", admin: true)
10.times do
  user = User.create(email: Faker::Internet.email, password: "password")

  puts "User created!"
end



motorbikes = [


  {
    image_url: ["https://kickstart.bikeexif.com/wp-content/uploads/2020/02/deus-guzzi-850-t3.jpg", "https://kickstart.bikeexif.com/wp-content/uploads/2020/02/deus-guzzi-850-t3-1.jpg", "https://kickstart.bikeexif.com/wp-content/uploads/2020/02/deus-guzzi-850-t3-4.jpg"],
    name: 'Braaaaaap',
    year: '2016',
    make: 'Moto Guzzi',
    model: '850 T3',
    category: 'Cafe Racer',
    description: 'You have probably heard the word ‘bitsa’ thrown around these parts if you’re a regular here. For the uninitiated, it’s a motorcycle that has ‘bits of everything.’ Bitsas are the mongrel dogs of the custom motorcycle world… and just like mongrels, some of them are hard to look at. But others are cross-bred in just the right way. This Moto Guzzi 850 T3 has Triumph, Norton, BSA and Dresda Triton bits on it, and it’s a total knockout—thanks to French builder Jeremy Tagand, who spins spanners at Deus ex Machina’s Australian headquarters.',
    address: 'Bari, Italy',
    price: 290
  },

  {
    image_url: ["https://cdnmedia.endeavorsuite.com/images/catalogs/17638/products/detail/524b69f4-3c80-4c80-bdb9-0415f5c00457.jpg", "https://cdnmedia.endeavorsuite.com/images/catalogs/17638/products/detail/31494350-022a-4d30-a0cb-cb851e8cf10e.jpg", "https://i1.wp.com/warungasep.net/wp-content/uploads/2018/10/yzf-r1-2019-rapid-red-460x315.jpg?resize=460%2C315", "https://www.otomaniac.com/wp-content/uploads/2015/09/Yamaha-YZF-R1-Red.jpg"],
    name: 'Braaaaaap',
    year: '2016',
    make: 'Yamaha',
    model: 'YZF-R1M',
    category: 'Superbike',
    description: 'Yamaha’s apex-predator Superbike-racing platform is ready to hit the track right out of the crate: Its powerful 999 cc crossplane-crankshaft equipped four-cylinder engine is kept in control by the latest in electronic rider aids, including GPS course mapping capability. Suspension is state-of-the-art Öhlins electronic ERS, and everything about the R1M has trickled down from MotoGP and World Superbike to provide the fastest possible lap times.',
    address: 'Foggia, France',
    price: 290
  },


  {
    image_url: ["https://imgx.gridoto.com/crop/0x0:0x0/700x465/photo/2019/07/10/3482866892.jpg", "https://cdn-2.returnofthecaferacers.com/wp-content/uploads/2017/10/motobailey-cb550-4-e1528246092792.jpg", "https://kickstart.bikeexif.com/wp-content/uploads/2020/03/1977-honda-cb550-cafe-racer.jpg", "https://www.lazone.id/news/honda-cb550-idaman-builder-retro-160130y.jpg19284"],
    name: 'Braaaaaap',
    year: '1976',
    make: 'Honda',
    model: 'CB550',
    category: 'Cafe Racer',
    description: 'The Honda CB550 is a 544 cc standard motorcycle made by Honda from 1974 to 1978. It has a four-cylinder SOHC air-cooled wet sump engine. The first version, the CB550K, was a development of the earlier CB500, and like its predecessor, had four exhaust pipes, four silencers and wire-spoked wheels.',
    address: 'Pau, France',
    price: 90
  },

  {
    image_url: ["https://www.harapanrakyat.com/wp-content/uploads/2019/09/Honda-Africa-Twin-2020-CRF1100L.jpg", "https://imgx.motorplus-online.com/crop/0x0:0x0/360x240/photo/2019/09/23/1271763764.jpg", "https://imgd.aeplcdn.com/393x221/bw/ec/39257/Honda-Africa-Twin-2019-Side-153732.jpg?wm=0&q=85", "https://ik.imagekit.io/hj8sm3kk7/medium/gallery/exterior/73/1592/honda-crf1000l-africa-twin-engine-view-703363.jpg"],
    name: 'Braaaaaap',
    year: '2016',
    make: 'Honda',
    model: 'Africa Twin XRV650',
    category: 'Enduro',
    description: 'This full-scale adventure bike was immediately heralded for being equally capable of crossing rugged continents and highway cruising. For 2018, the “True Adventure” spirit of the original AT expanded with the introduction of the CRF1000L2 Africa Twin Adventure Sports, with a big 6.4-gallon fuel tank among other things, designed to give it even greater range. Both Africa Twins use a powerful, highly tractable 998 cc Parallel twin to let these bikes make their way through, over or around nearly any obstacle.',
    address: 'Grenoble, France',
    price: 90
  },

  {
    image_url: ["https://images.pexels.com/photos/39693/motorcycle-racer-racing-race-speed-39693.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", "https://images.unsplash.com/photo-1529946607596-ce8147321723?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"],
    name: 'Superfast R1',
    year: '2020',
    make: 'Yamaha',
    model: 'R1',
    category: 'Sportbike',
    description: 'The engines torque and power delivery are unmistakable, with the four catalysers doing little to mute the MotoGP exhaust note!',
    address: 'London, UK',
    price: 125
  },

  {
    image_url: ["https://ik.imagekit.io/hj8sm3kk7/medium/gallery/exterior/73/1250/honda-goldwing-marketing-image-147931.jpg", "https://i.ytimg.com/vi/TvU2TE_M7Es/maxresdefault.jpg", "https://www.roadrunner.travel/images/articles/heading/7382.jpg"],
    name: 'Cop Bike',
    year: '2008',
    make: 'Honda',
    model: 'Goldwing',
    category: 'Cruiser',
    description: 'Totally overhauled for 2008 with an all-new 1833 cc boxer six that’s more powerful as well as more fuel-efficient, the new `Wing carries on the tradition of the bike that basically invented luxury long-distance motorcycle touring. The optional Dual Clutch Transmission makes the bike amazingly easy to ride. Making the entire bike smaller and lighter while updating the suspension makes it way sportier, and adding modern electronics was a big part of the overhaul: A 7-inch TFT houses the infotainment/navigation system (now approved for use with Apple CarPlay). Together with sister ship Gold Wing Tour – which adds a top box and a few other amenities – this bike has created its own dedicated community, and with good reason.',
    address: 'Frankfurt, Germany',
    price: 150
  },


   {
    image_url: ["https://images.pexels.com/photos/1309668/pexels-photo-1309668.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://i.pinimg.com/originals/cd/a7/88/cda788ea03af41319dd359f5f83359e4.jpg"],
    name: 'Fun Ducati!',
    year: '2017',
    make: 'Ducati',
    model: 'Streetfighter 1098s',
    category: 'Naked Bike',
    description: 'Ducati claim it’s the lightest bike in the class, at 167kg (17kg lighter than the S4Rs it replaces) and it’s also the most powerful Ducati naked bike ever made. It’s a liquid-cooled, 155bhp V-twin bruiser that uses a hybrid 1098/1198 motor, a modified frame for more stability and a slightly longer swingarm. Think of it a cross between a big supermoto and a Monster and you’ll be on the right track!',
    address: 'Amsterdan, Netherlands',
    price: 17
  },

  {
    image_url: ["https://psmfirestorm.blob.core.windows.net/crs-images/210557/7987/original.jpg", "https://images.pexels.com/photos/595807/pexels-photo-595807.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://cdn.dealerspike.com/imglib/v1/800x600/imglib/Assets/Inventory/EE/F2/EEF298CC-1375-4E43-A599-C33433D9A896.jpg"],
    name: 'Ninja Power!',
    year: '2018',
    make: 'Kawasaki',
    model: 'Ninja 650',
    category: 'Sportbike',
    description: 'Reinvigorated to further embody Ninja® sportbike lineage, the new 2020 Ninja® 650 motorcycle comes packed with a sporty 649cc engine, next-level technology advancements and sharp styling updates. Unmistakable sport performance is met with an upright riding position for exciting daily commutes, while a supreme level of attitude reminds you of its legendary heritage.',
    address: 'Delft, Netherlands',
    price: 12
  },

  {
    image_url: ["https://bd.gaadicdn.com/processedimages/triumph/rocket-3/source/v_rocket-3-std1564575462.jpg?tr=h-48", "https://img.drivemag.net/media/default/0001/97/Triumph-Rocket-III-2-9011-default-large.jpeg"],
    name: 'Englands Finest!',
    year: '2020',
    make: 'Triumph',
    model: 'Rocket',
    category: 'Cruiser',
    description: 'A genuine motorcycle legend, the original Triumph Rocket was a pure original equipped with the world’s largest production motorbike engine and more muscle and presence than all others. The next chapter in this incredible story was introduced with an all-new Rocket TFC, which once again tore up the rule book and set a whole new benchmark for torque, performance, capability and style.',
    address: 'Munich, Germany',
    price: 20
  },

  {
    image_url: ["https://images.unsplash.com/photo-1558981001-5864b3250a69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1558980394-4c7c9299fe96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://stat.overdrive.in/wp-content/odgallery/2017/10/39047_harley-davidson_fat_boy_1.jpg"],
    name: 'Murica!!!',
    year: '2020',
    make: 'Harley Davidson',
    model: 'Fat Boy',
    category: 'Cruiser',
    description: 'Designed by Willie G. Davidson and Louie Netz, Harley-Davidson built a prototype Fat Boy in Milwaukee for the Daytona Bike Week rally at Daytona Beach in 1988 and 1989',
    address: 'Berlin, Germany',
    price: 21
  },

  {
    image_url: ["https://imgd.aeplcdn.com/1280x720/bw/models/ducati-panigale-v4-r.jpg?20190103151915, https://cdn1-production-images-kly.akamaized.net/wxhV2fOpcwWcZp4ZxsytrD6BzZk=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2762495/original/019051800_1553678447-2019_Ducati_Panigale_V4_R_Motorcycle.jpg, https://cdn-1.motorsport.com/images/mgl/2wBz1pB0/s8/ducati-panigale-v4r-1.jpg, https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80, https://imgd.aeplcdn.com/1280x720/bw/models/ducati-panigale-v4-r.jpg?20190103151915"],
    name: 'Italys finest!',
    year: '2020',
    make: 'Ducati',
    model: 'Panigale V4R',
    category: 'Superbike',
    description: 'Are you single? Wish you had a girlfriend? Trust me. Rent this bike and you wont be single for long! You know you want to ride this bike. Do yourself a favor and rent this beauty!!!',
    address: 'Milan, Italy',
    price: 25
  },

  {

    image_url: ["https://cdn.dealerspike.com/imglib/v1/800x600/imglib/Assets/Inventory/32/D9/32D9E6C0-93C4-4E7E-BE7A-D95F8E08C285.jpg" , "https://images.unsplash.com/photo-1572506745854-299ae0b55400?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"],
    name: 'Another ok piece of British Engineering.',
    year: '2014',
    make: 'Triumph',
    model: 'Street Triple',
    category: 'Naked',
    description: 'Triumph makes a point of emphasizing that the Street Triple is the lightest in its class, a claimed 366 dry weight for the 2020 model. I suppose in part that depends on how you define the class, but by any measure the new bike retains the lightweight, compact feel the line has always been known for. The neutral, natural ergonomics make this a motorcycle I could ride all day long, wanting for nothing except some wind protection.The slipper and assist clutch is light, the brakes are as good as Spurgeon said they were and within a few miles I just feel comfortable with the bike. It always takes me a little time reach an understanding with any motorcycle I\'m riding for the first time. With the Street Triple RS, I\'m comfortable almost immediately.',
    address: 'Utrecht, Netherlands',
    price: 90
  },

  {

    image_url: ["https://images.unsplash.com/photo-1580310390364-19360356c52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1580310614729-ccd69652491d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" "https://images.unsplash.com/flagged/photo-1563806164183-25d492848b25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"],

    name: 'Little Ninja Power!',
    year: '2017',
    make: 'Kawasaki',
    model: 'Ninja 300',
    category: 'Sportbike',
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
    category: 'Cruiser',
    description: 'Old is in. Harley reached all the way back to 1948 to find the inspiration for the Springer Softail.The chrome-intensive front stands in contrast to the clean understatement of the Softail rear suspension, and lends the bike a raked-out look.',
    address: 'Brugge, Belgium',
    price: 190
  },

  {
    image_url: ["https://stat.overdrive.in/wp-content/odgallery/2019/06/52784_BMWS1000RR_014_jk.jpg", "https://auto.ndtvimg.com/bike-images/large/bmw/s-1000-rr/bmw-s-1000-rr.webp?v=7"],
    name: 'Lets get some speeding tickets!',
    year: '2019',
    make: 'BMW',
    model: 'S 1000 RR',
    category: 'Superbike',
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
    category: 'Cafe Racer',
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
    category: 'Superbike',
    description: 'The RSV4 project has always pursued a stated goal: to be the absolute best and fastest uncompromising superbike, the closest to Aprilia racing bikes in terms of performance and effectiveness. A premium product at the top of its category, dedicated to extremely demanding customers who want top shelf performance and refined technical equipment.',
    price: 330
  },


  {
    image_url: ["https://images.unsplash.com/photo-1574313007729-055d09a7ce85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80", "https://images.unsplash.com/photo-1529946607596-ce8147321723?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80https://i.pinimg.com/originals/cd/a7/88/cda788ea03af41319dd359f5f83359e4.jpg"],
    name: 'Superfast R1',
    year: '2020',
    make: 'Yamaha',
    model: 'R1',
    category: 'Superbike',
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
    category: 'Naked',
    description: 'This is a mean and nasty Ducati that delivers a wild ride. It’s not practical in any way, shape or form, but it is bloody good fun to ride thanks to a storming engine and thoroughly sorted chassis. If this sounds like your kind of bike, give the Streetfighter a blast. If not, then avoid it and buy something like a Monster that is still naked, but considerably more refined.',
    address: 'Amsterdan, Netherlands',
    price: 17
  },

  {
    image_url: ["https://images.pexels.com/photos/595807/pexels-photo-595807.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://psmfirestorm.blob.core.windows.net/crs-images/210557/7987/original.jpg"],
    name: 'Nimble and Fast!!!!',
    year: '2018',
    make: 'Kawasaki',
    model: 'Ninja 650',
    category: 'Sportbike',
    description: 'Reinvigorated to further embody Ninja® sportbike lineage, the new 2020 Ninja® 650 motorcycle comes packed with a sporty 649cc engine, next-level technology advancements and sharp styling updates. Unmistakable sport performance is met with an upright riding position for exciting daily commutes, while a supreme level of attitude reminds you of its legendary heritage.',
    address: 'Delft, Netherlands',
    price: 12
  },
]




motorbikes.each do |motorbike_hash|
  new_motorbike = Motorbike.new(year: motorbike_hash[:year], make: motorbike_hash[:make], model: motorbike_hash[:model], description: motorbike_hash[:description], address: motorbike_hash[:address],price: motorbike_hash[:price], category: motorbike_hash[:category] )
  new_motorbike.user = User.all.sample

  motorbike_hash[:image_url].each do |img_url|
    p img_url
    file = URI.open(img_url)
    new_motorbike.photos.attach(io: file, filename: "#{motorbike_hash[:name]}.jpg", content_type: 'image/jpg')
  end
  new_motorbike.save
  puts "Motorbike created!"
end



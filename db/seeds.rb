require "open-uri"

puts 'Cleaning database'
#User.destroy_all

@areas = [
  "Piscina",
  "Churrasqueira",
  "Elevador",
  "Salão de festas",
  "Salão de jogos adulto",
  "Quadra",
  "Salão de jogos infantil",
  "Sala de cinema"
]

@notes = [
  "Manutenção preventiva:",
  "Manutenção:",
  "Novas regras de uso para:",
  "Orçamento de reparo:"
]

puts("Criando User admin..")
file = URI.open("https://source.unsplash.com/featured/?profile")
@user = User.create!(
  user_name: "admin.user",
  full_name: "Clorisvaldo Antunes",
  email: "admin@resdjf.com",
  admin: true,
  password: "123123"
)
@user.avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
@user.save
puts("User admin inserido!")

puts("Criando Condomínio..")
@c = Condo.create!(
  name: "Residencial Jardim Florido",
  address: "Le Wagon",
  number: "1040",
  city: "São Paulo",
  uf: Uf.find(20),
  user: @user
)
puts("Condomínio inserido!")

puts("Criando Apartamentos..")
4.times do |x|
  4.times do |y|
    ap_number = "#{x + 1}0#{y + 1}"
    Apartament.create!(
      ap_number: ap_number.to_s,
      floor: x + 1,
      bedrooms: rand(2..4),
      square_meters: rand(50..80),
      garage: [true, false].sample,
      condo: @c,
      user: User.create!(
        user_name: "Apartamento #{ap_number}",
        full_name: Faker::Name.name,
        email: Faker::Internet.email,
        admin: false,
        password: "123123"
      )
    )
  end
end
puts("Apartamentos inseridos!")

puts("Criando algumas notas")
2.times do
  Note.create!(
    condo: @c,
    title: "#{@notes.sample} #{@areas.sample}",
    noteDate: Date.today,
    note_category: NoteCategory.all.sample,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta nibh et augue congue, eget iaculis ligula pharetra. Pellentesque ornare sit amet tellus nec hendrerit. Nunc vel elit sed arcu hendrerit convallis. Sed tortor massa, molestie ac ultricies ut, bibendum eu erat. Praesent risus ante, mattis a leo at, venenatis porttitor ante. Vestibulum egestas dolor elit, et eleifend dui aliquet et. Mauris id dolor vel nisl interdum euismod.
    Phasellus ut varius diam, ac tristique velit. Praesent congue libero lacus, ut consequat turpis viverra sit amet. Vivamus neque purus, feugiat vitae feugiat eu, auctor et sapien. In euismod auctor orci, vel ornare ex aliquet eu. Suspendisse a faucibus ligula, vel varius sem. Ut erat lorem, venenatis nec dolor quis, hendrerit tempus augue. Aliquam leo nulla, interdum fermentum vulputate ut, semper et ex. In vehicula ultrices mi, nec commodo ante dictum ac. Curabitur fermentum, felis mollis venenatis ultricies, mi purus maximus magna, venenatis porta arcu purus vulputate arcu. Maecenas condimentum rhoncus tortor, vel ultrices nisi malesuada ut. Proin mi arcu, consectetur et turpis ac, convallis auctor sapien."
  )
end
2.times do
  Note.create!(
    condo: @c,
    title: "#{@notes.sample} #{@areas.sample}",
    noteDate: Date.tomorrow,
    note_category: NoteCategory.all.sample,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta nibh et augue congue, eget iaculis ligula pharetra. Pellentesque ornare sit amet tellus nec hendrerit. Nunc vel elit sed arcu hendrerit convallis. Sed tortor massa, molestie ac ultricies ut, bibendum eu erat. Praesent risus ante, mattis a leo at, venenatis porttitor ante. Vestibulum egestas dolor elit, et eleifend dui aliquet et. Mauris id dolor vel nisl interdum euismod.
    Phasellus ut varius diam, ac tristique velit. Praesent congue libero lacus, ut consequat turpis viverra sit amet. Vivamus neque purus, feugiat vitae feugiat eu, auctor et sapien. In euismod auctor orci, vel ornare ex aliquet eu. Suspendisse a faucibus ligula, vel varius sem. Ut erat lorem, venenatis nec dolor quis, hendrerit tempus augue. Aliquam leo nulla, interdum fermentum vulputate ut, semper et ex. In vehicula ultrices mi, nec commodo ante dictum ac. Curabitur fermentum, felis mollis venenatis ultricies, mi purus maximus magna, venenatis porta arcu purus vulputate arcu. Maecenas condimentum rhoncus tortor, vel ultrices nisi malesuada ut. Proin mi arcu, consectetur et turpis ac, convallis auctor sapien."
  )
end
puts("Notas inseridas!")

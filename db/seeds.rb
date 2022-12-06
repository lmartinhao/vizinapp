require "open-uri"

puts 'Cleaning database'
User.destroy_all

@areas = [
  "Piscina",
  "Churrasqueira",
  "Elevador",
  "Salão de festas",
  "Salão de jogos",
  "Quadra",
]

@notes = [
  "Manutenção preventiva:",
  "Manutenção:",
  "Novas regras de uso para:",
  "Orçamento de reparo:"
]

@tipos = [
  "Condomínio",
  "Edifício",
  "Conjunto Habitacional",
  "Torres"
]

ufs = [
  { id: 11, sigla: "RO", nome: "Rondônia" },
  { id: 12, sigla: "AC", nome: "Acre" },
  { id: 13, sigla: "AM", nome: "Amazonas" },
  { id: 14, sigla: "RR", nome: "Roraima" },
  { id: 15, sigla: "PA", nome: "Pará" },
  { id: 16, sigla: "AP", nome: "Amapá" },
  { id: 17, sigla: "TO", nome: "Tocantins" },
  { id: 21, sigla: "MA", nome: "Maranhão" },
  { id: 22, sigla: "PI", nome: "Piauí" },
  { id: 23, sigla: "CE", nome: "Ceará" },
  { id: 24, sigla: "RN", nome: "Rio Grande do Norte" },
  { id: 25, sigla: "PB", nome: "Paraíba" },
  { id: 26, sigla: "PE", nome: "Pernambuco" },
  { id: 27, sigla: "AL", nome: "Alagoas" },
  { id: 28, sigla: "SE", nome: "Sergipe" },
  { id: 29, sigla: "BA", nome: "Bahia" },
  { id: 31, sigla: "MG", nome: "Minas Gerais" },
  { id: 32, sigla: "ES", nome: "Espírito Santo" },
  { id: 33, sigla: "RJ", nome: "Rio de Janeiro" },
  { id: 35, sigla: "SP", nome: "São Paulo" },
  { id: 41, sigla: "PR", nome: "Paraná" },
  { id: 42, sigla: "SC", nome: "Santa Catarina" },
  { id: 43, sigla: "RS", nome: "Rio Grande do Sul" },
  { id: 50, sigla: "MS", nome: "Mato Grosso do Sul" },
  { id: 51, sigla: "MT", nome: "Mato Grosso" },
  { id: 52, sigla: "GO", nome: "Goiás" },
  { id: 53, sigla: "DF", nome: "Distrito Federal" }
]
puts("Criando os estados..")

ufs.each do |uf|
  u = Uf.new(
    id_uf: uf[:id],
    sigla: uf[:sigla],
    name: uf[:nome]
  )
  u.save
end
puts("Estados inseridos!")

puts("Criando Note Categories..")

NoteCategory.create!(name: "Evento")
NoteCategory.create!(name: "Notificação")

puts("Note Categories inseridas!")

puts("Criando Documents Categories..")

DocumentCategory.create!(name: "Regimento")
DocumentCategory.create!(name: "Ata de Reunião")

puts("Note Categories inseridas!")

puts("Criando Areas Categories..")

AreaCategory.create!(name: "Churrasqueira")
AreaCategory.create!(name: "Conjunto de Mesas")
AreaCategory.create!(name: "Salão de Festas")

puts("Note Categories inseridas!")

puts("Criando User admin..")
file = URI.open("https://source.unsplash.com/featured/?profile")
@user = User.create!(
  user_name: "admin.user",
  full_name: "User Test",
  email: "user@test.com",
  admin: true,
  password: "123123"
)
@user.avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
@user.save
puts("User admin inserido!")

puts("Criando Condomínio..")
@c = Condo.create!(
  name: "#{@tipos.sample} #{Faker::Name.name}",
  address: Faker::Address.street_name,
  number: Faker::Address.building_number,
  city: Faker::Address.city,
  uf: Uf.all.sample,
  user: @user
)
puts("Condomínio inserido!")

puts("Criando Apartamentos..")
10.times do
  file = URI.open("https://source.unsplash.com/featured/?profile")
  Apartament.create!(
    ap_number: rand(10..250),
    floor: rand(1..25),
    bedrooms: rand(2..4),
    square_meters: rand(50..80),
    garage: [true, false].sample,
    condo: @c,
    user: User.create!(
      user_name: "Apartamento #{rand(10..250)}",
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      admin: false,
      password: "123123",
      avatar: avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
    )
  )
end
puts("Apartamentos inseridos!")

puts("Criando algumas notas")
6.times do
  Note.create!(
    condo: @c,
    title: "#{@notes.sample} #{@areas.sample}",
    noteDate: Date.today,
    note_category: NoteCategory.all.sample,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta nibh et augue congue, eget iaculis ligula pharetra. Pellentesque ornare sit amet tellus nec hendrerit. Nunc vel elit sed arcu hendrerit convallis. Sed tortor massa, molestie ac ultricies ut, bibendum eu erat. Praesent risus ante, mattis a leo at, venenatis porttitor ante. Vestibulum egestas dolor elit, et eleifend dui aliquet et. Mauris id dolor vel nisl interdum euismod.
    Phasellus ut varius diam, ac tristique velit. Praesent congue libero lacus, ut consequat turpis viverra sit amet. Vivamus neque purus, feugiat vitae feugiat eu, auctor et sapien. In euismod auctor orci, vel ornare ex aliquet eu. Suspendisse a faucibus ligula, vel varius sem. Ut erat lorem, venenatis nec dolor quis, hendrerit tempus augue. Aliquam leo nulla, interdum fermentum vulputate ut, semper et ex. In vehicula ultrices mi, nec commodo ante dictum ac. Curabitur fermentum, felis mollis venenatis ultricies, mi purus maximus magna, venenatis porta arcu purus vulputate arcu. Maecenas condimentum rhoncus tortor, vel ultrices nisi malesuada ut. Proin mi arcu, consectetur et turpis ac, convallis auctor sapien."
  )
end
puts("Notas inseridas!")

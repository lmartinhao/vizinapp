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
NoteCategory.create!(
  name: "Evento"
)
NoteCategory.create!(
  name: "Notificação"
)
puts("Note Categories inseridos!")


puts("Criando User admin..")
@user = User.create!(
  user_name: "admin.user",
  full_name: "User Test",
  email: "user@test.com",
  admin: true,
  password: "123123"
)
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

#c.save
#@user.condo = @c
#@user.save
puts("Condominio inserido!")

puts("Criando Apartamentos..")
10.times do
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
      password: "123123"
    )
  )
end
puts("Apartamentos inserido!")


#User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

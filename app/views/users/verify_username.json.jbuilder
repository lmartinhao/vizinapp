if @username.size < 1
  json.message render(partial: "users/validation", formats: :html, locals: {message: "Nome de Usuário válido ✅"})
else
  json.message render(partial: "users/validation", formats: :html, locals: {message: "Nome de Usuário inválido!"})
end

=begin
Flavio Nasicmento
05.05.2024

Pequeno projeto em Ruby com objetivo de aplicar alguns conhecimentos recem adquiridos na linguagem afim apenas de fixar
principalmente sua sintaxe, que e bem diferente das linguagens que ja fiz uso.

NOTA: Uso teclado padrao Estados Unidos, por mais dificil que seja, ignorar as faltas de acentuacoes. LIDEM COM ISSO!
=end

# Array de objetos
@schedule = [
  {name: 'Flavio', phone: '123'},
  {name: 'Nascimento', phone: '321'},
  {name: 'Anacleto', phone: '111'},
  {name: 'Reinaldo', phone: '222'},
]

# Aqui, percorremos a lista @schedule afim de retornar cada um dos itens contidos.
def show_everyone
  # Percorremos a lista dando nome de 'contact' para cada um dos objetos dentro dela.
  @schedule.each do |contact|
    puts "---------------------------------------"
    puts "#{contact[:name]}: #{contact[:phone]}"
    puts "---------------------------------------\n"
  end
end

# Funcao responsavel por adicionar novos contatos dentro da lista.
def add_contact
  print "nome: "
  add_contact_name = gets.chomp
  print "phone: "
  add_contact_phone = gets.chomp
  # Utilizando das variaveis alimentadas acima, fazemos adicao dentro do array de objetos, de maneira estruturada.
  @schedule << { name: add_contact_name, phone: add_contact_phone }
end

# Funcao responsavel por fazer busca por um contato especifico dentro do array de objetos
def search_contact
  print "Who you are looking for?"
  contact_name = gets.chomp
  # Logo apos coletar-mos o nome do contato que queremos fazer busca, percorremos o array checando e retornando o primeiro contato no qual o nome seja exatamente o mesmo do que fora passado.
  @schedule.each do |contact|
    if contact[:name] == contact_name
      # Retornamos o contato e seu numero
      puts "Contact #{contact[:name]} has been found, and his number is #{contact[:phone]}\n\n\n"
    end
  end
end

# Funcao responsavel por editar contatos especificos, utilizando de logica parecida com a pesquisa, afim de localizar exatamente o contato que devera ser editado.
def edit_contact
  print "Who you want to edit?"
  contact_name = gets.chomp
  @schedule.each do |contact|
    # A partir do momento em que o nome e encontrado, iremos editar o nome e telefone, caso nao deseje alterar um dos campos, basta pressional ENTER que a opracao seguira.
    if contact[:name] == contact_name
      print "Edit NAME (Press ENTER if you don't want to)"
      # Salvamos o nome original do contato.
      original_name = contact[:name]
      # Passamos o novo nome do contato em questao
      contact[:name] = gets.chomp
      # Porem, fazemos aqui uma validacao, caso o novo nome esteja vazio, iremos retornar o valor original, armazenado em original_name || phone.
      contact[:name] = contact[:name].empty? ? original_name : contact[:name]

      print "Edit PHONE (Press ENTER if you don't want to)"
      original_phone = contact[:phone]
      contact[:phone] = gets.chomp
      contact[:phone] = contact[:phone].empty? ? original_phone : contact[:phone]
    end
  end
end

# Funcao responsavel por remover algum contato do array de objetos.
def remove_contact
  print "Who you want to delete?"
  contact_name = gets.chomp
  # Parecida com as funcoes anteriores, aqui fazemos novamente loop em meio a lista de objetos
  @schedule.each do |contact|
    if contact_name == contact[:name]
      # Apos encontrado o objeto, utilizamos da funcao delete, seguido de uma confirmacao do objeto por completo.
      @schedule.delete(contact)
      puts "Contact #{contact[:name]} has been deleted.\n"
    end
  end
end

# loop responsible to make the code still running, even after, the execution of any of the options, except of course, the exit option.
loop do
  puts "
  1. All Contacts\n
  2. Add\n
  3. Search\n
  4. Edit\n
  5. Remove\n
  0. Sair
      "

  # Right here, we have a variable where be called right after puts above.
  print "What we going to do ? "
  code = gets.chomp.to_i

  case
  when code == 0
    puts "Goodbye, my friend!"
    break
  when code == 1
    show_everyone
  when code == 2
    add_contact
  when code == 3
    search_contact
  when code == 4
    edit_contact
  when code == 5
    remove_contact
  end
end

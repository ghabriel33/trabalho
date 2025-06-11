programa
{
    // Constantes para definir os limites da agenda
    const inteiro MAX_CONTATOS = 10 ,MAX_USUARIOS = 3
    
    // Estruturas para armazenar os contatos
    cadeia nomes[MAX_CONTATOS]
    cadeia telefones[MAX_CONTATOS]
    inteiro totalContatos = 0

	cadeia usuarios[MAX_USUARIOS]
	cadeia senhas[MAX_USUARIOS]
	inteiro totalUsuarios = 0

	logico logado = falso
	cadeia usuarioAtual = ""
    // Função para adicionar um novo contato
    funcao adicionarContato()
    {
        se (totalContatos >= MAX_CONTATOS) {
            escreva("Agenda cheia! Não é possível adicionar mais contatos.\n")
        } senao {
            cadeia nome, telefone
            logico contatoExiste = falso
            
            faca {
            escreva("Digite o nome do contato: ")
            leia(nome)
            escreva("Digite o telefone do contato: ")
            leia(telefone)

            para (inteiro i = 0; i < totalContatos; i++) {
              se (nomes[i] == nome) {
                  contatoExiste = verdadeiro
              }
            }
            se(contatoExiste){
              escreva("Nome já cadastrado na agenda, use um nome diferente", "\n")
            }
            } enquanto(contatoExiste)
                        
            nomes[totalContatos] = nome
            telefones[totalContatos] = telefone
            totalContatos = totalContatos + 1
            
            escreva("Contato adicionado com sucesso!\n")
        }
    }
    
    // Função para listar todos os contatos
    funcao listarContatos()
    {
        se (totalContatos == 0) {
            escreva("Nenhum contato cadastrado na agenda.\n")
        } senao {
            escreva("\n--- LISTA DE CONTATOS ---\n")
            para (inteiro i = 0; i < totalContatos; i++) {
                escreva((i+1), ". Nome: ", nomes[i], " - Telefone: ", telefones[i], "\n")
            }
            escreva("Total de contatos: ", totalContatos, "\n")
        }
    }
    
    // Função para buscar um contato pelo nome
    funcao buscarContato()
    {
        se (totalContatos == 0) {
            escreva("Nenhum contato cadastrado na agenda.\n")
            retorne
        }
        
        cadeia nomeBusca
        logico encontrou = falso
        
        escreva("Digite o nome do contato a buscar: ")
        leia(nomeBusca)
        
        para (inteiro i = 0; i < totalContatos; i++) {
            se (nomes[i] == nomeBusca) {
                escreva("Contato encontrado:\n")
                escreva("Nome: ", nomes[i], " - Telefone: ", telefones[i], "\n")
                encontrou = verdadeiro
                pare
            }
        }
        
        se (encontrou == falso) {
            escreva("Contato não encontrado.\n")
        }
    }
    
    // Função para remover um contato (nome corrigido)
    funcao removerContato()
    {
        se (totalContatos == 0) {
            escreva("Nenhum contato cadastrado na agenda.\n")
            retorne
        }
        
        cadeia nomeRemover
        inteiro posicao = -1
        
        escreva("Digite o nome do contato a remover: ")
        leia(nomeRemover)
        
        // Busca o contato
        para (inteiro i = 0; i < totalContatos; i++) {
            se (nomes[i] == nomeRemover) {
                posicao = i
                pare
            }
        }
        
        se (posicao == -1) {
            escreva("Contato não encontrado.\n")
        } senao {
            // Remove o contato movendo os demais para preencher o espaço
            para (inteiro i = posicao; i < totalContatos - 1; i++) {
                nomes[i] = nomes[i + 1]
                telefones[i] = telefones[i + 1]
            }
            
            totalContatos = totalContatos - 1
            escreva("Contato removido com sucesso!\n")
        }
    }
    
    // Função para exibir o menu principal
    funcao menuPrincipal()
    {
        inteiro opcao
        
        faca {
            escreva("\n--- AGENDA TELEFÔNICA ---\n")
            escreva("1. Adicionar contato\n")
            escreva("2. Listar contatos\n")
            escreva("3. Buscar contato\n")
            escreva("4. Remover contato\n")
            escreva("5. Sair\n")
            escreva("Escolha uma opção: ")
            leia(opcao)
            
            escolha (opcao) {
                caso 1:
                    adicionarContato()
                    pare
                caso 2:
                    listarContatos()
                    pare
                caso 3:
                    buscarContato()
                    pare
                caso 4:
                    removerContato()  // Nome corrigido
                    pare
                caso 5:
                    escreva("Saindo da agenda telefônica...\n")
                    pare
                caso contrario:
                    escreva("Opção inválida! Tente novamente.\n")
            }
        } enquanto (opcao != 5)
    }
    funcao cadastrarUsuario()
	{
		se (totalUsuarios >= MAX_USUARIOS) {
			escreva("Limite de usuários atingido.")
		} senao {
			escreva("Digite o nome do novo usuário: ")
			leia(usuarios[totalUsuarios])
			escreva("Digite a senha: ")
			leia(senhas[totalUsuarios])
			totalUsuarios = totalUsuarios + 1
			escreva("Usuário cadastrado com sucesso!")
		}
	}

	funcao logico fazerLogin()
{
	cadeia nome, senha

	para (inteiro tentativas = 1; tentativas <= 3; tentativas++) {
		escreva("Digite o nome de usuário: ")
		leia(nome)
		escreva("Digite a senha: ")
		leia(senha)

		para (inteiro i = 0; i < totalUsuarios; i++) {
			se (usuarios[i] == nome e senhas[i] == senha) {
				usuarioAtual = nome
				escreva("Login realizado com sucesso!")
				retorne verdadeiro
			}
		}

		se (tentativas < 3) {
			escreva("Usuário ou senha incorretos.", "\n")
			se (tentativas == 2) {
				escreva("ATENÇÃO: Mais uma tentativa!", "\n")
			}
		}
	}

	escreva("Número máximo de tentativas excedido. Tente novamente mais tarde...", "\n")
	retorne falso
}
        
    // Função principal que inicia o programa
    funcao inicio()
	{
		inteiro opcao

		faca {
      escreva("Bem-vindo à Agenda Telefônica!\n")
			escreva("\n--- MENU INICIAL ---", "\n")
			escreva("1. Cadastrar usuário", "\n")
			escreva("2. Fazer login", "\n")
			escreva("3. Sair", "\n")
			escreva("Escolha uma opção: ")
			leia(opcao)

			escolha (opcao) {
				caso 1:
					cadastrarUsuario()
					pare
				caso 2:
					logado = fazerLogin()
					se (logado) {
						menuPrincipal()
					}
					pare
				caso 3:
					escreva("Encerrando o programa...")
					pare
				caso contrario:
					escreva("Opção inválida.")
			}
		} enquanto (opcao != 3)
	}
}
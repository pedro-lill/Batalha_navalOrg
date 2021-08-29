    # Os navios do inimigo est?o colocados em uma string chamada ?navios?? presente na ?rea
    # de dados (.data), que deve ser lida pela fun??o insere_embarcacoes no in?cio do jogo. A
    # string navios possui o seguinte padr?o. Na primeira linha ? informado o n?mero de navios
    # inseridos. Cada uma das linhas seguintes possui um navio. As linhas que especificam navios
    # possuem 4 valores, separados por um espa?o, sendo: o primeiro valor ? a disposi??o do navio
    # sendo, 0 para navio na horizontal e 1 para navio na vertical; o segundo valor ? o comprimento do
    # navio; o terceiro valor ? a linha inicial do navio e; o quarto valor ? a coluna inicial do navio.
    # Observe o Exemplo:
    # 3 -> numero de navios inseridos
    # 1[vertical]   5[comprimento] 1[linha inicial] 1[coluna inicial] ->navio
    # 0[horizontal] 5[comprimento] 2[linha inicial] 2[coluna inicial] ->navio
    # 0[horizontal] 1[comprimento] 6[linha inicial] 4[coluna inicial] ->navio
    # O posicionamento de navios mostrado acima resulta no seguinte posicionamento:
    # A fun??o insere_embarcacoes deve verificar a validade do posicionamento dos navios,
    # gerando uma mensagem de erro para as seguintes situa??es:
    #     
    .data
navios: .string     "3 1 5 1 1 0 5 2 2 0 1 6 4"

#titulo: .asciiz "\n************* Batalha naval *************\n*****************************************\n" # **                MENU                 **\n**      1       P1 vs IA               **\n**      2       P1 vs P2               **\n**      3       EXIT                   **\n*****************************************\n*****************************************\n"
#maquina_jogando: .asciiz "\nMaquina esta processando a jogada...\n"
#linha: .asciiz "\n"
#txt_jogada_H: .asciiz "Coluna: "
#txt_jogada_V: .asciiz "Linha: "
#txt_player1: .asciiz "Player 1, em qual posicao deseja jogar? "
#txt_menu: .asciiz "Digite a opcao: "
#msg_valor_menu: "\nATENCAO: Valor do menu deve ser menor ou igual a 3!\n"
 
#txt_placar: .asciiz "\n*************     PLACAR    *************\n*****************************************\n" # **      PLAYER 1        PLAYER 2       **\n**         "            
#espaco: .asciiz "               "
   .text

main:
    la a0, navios           # carrega navio em a0  -> navios: .string     "3 (1 5 1 1) 0 5 2 2 0 1 6 4"
    # jal identifica_qtd      # jal para identifica_qtd
    # add s0, zero, s0

insere_embarcacoes:
    lb t4, 0(a0)            # carrega navios em t4
    addi t4, t4, -48       # a0/t4 => 3              cod ascci 0/ trasnformar a string 3 em int 3
    
    
    teste_1:
        beq t4, zero, next_loop       # identifica_qtd
    le_direcao:
        
        addi a0, a0, 2      # horizontal[0] ou vertical[1]
        lb s0, (a0)         # direcao em s0
        addi s0, s0, -48    # transforma a string em inteiro(ascii)
 
        addi a0, a0, 2      # comprimento
        lb s1, (a0)
        addi s1, s1, -48

        addi a0, a0, 2      # linha inicial
        lb s2, (a0)
        addi s2, s2, -48

        addi a0, a0, 2      # coluna inicial
        lb s3, (a0)
        addi s3, s3, -48

	next_loop:
        addi a0, a0, 0
        lb t4, (a0)
        j teste_1



identifica_qtd:
    
horizontal:

vertical:

x:
    

y:

end_count:
    

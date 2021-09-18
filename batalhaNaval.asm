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
navios: .string     "3 1 1 1 1 0 5 2 2 0 4 6 4 "
br_n: .string       "\n"
msgCpm:    .string     "O navio extrapola as dimensoes da matriz"
msgPosCol:     .string     "A posicao do navio eh invalida (coluna)"
msgPosLin:     .string     "A posicao do navio eh invalida (linha)"
msgSobrepos:     .string     "Ocorre sobreposicao nos navios"
interativo:     .string     "\n Escolha uma das opcoes: \n 0-reiniciar o jogo \n 1-estado atual da matriz de navios \n 2-fazer uma nova jogada \n "
recorde:        .string     "\n --------- Recorde --------- \n"
recTiro:        .string     "Tiros : \n"
recAcertos:        .string     "Acertos : \n"
recAfundados:        .string     "Afundados : \n"
voce:           .string         "\n --------- Voce --------- \n"
vcTiros:        .string     "Tiros : \n"
vcAcertos:        .string     "Acertos : \n"
vcAfundados:        .string     "Afundados : \n"
vcUltimo:       .string         "Ultimo tiro : \n"

matriz:     .word     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

space:	.string		" "
   .text

main:
    # jal identifica_qtd      # jal para identifica_qtd
    # add s0, zero, s0
    jal tela_inicial
    jal insere_embarcacoes
    jal printa_matriz
    
    jal fim



insere_embarcacoes:
    la a0, navios           # carrega navio em a0  -> navios: .string     "3 (1 5 1 1) 0 5 2 2 0 1 6 4"
    lb t4, 0(a0)            # carrega navios em t4
    addi t4, t4, -48       # a0/t4 => 3              cod ascci 0/ trasnformar a string 3 em int 3

    li t3, 0            # carrega 0 em t3
    li t5, 4            # carrega 4 em t5
    li t6, 10           # carrega 10 em t6
    li s7, 32		# carrega espaco em s7

    addi s9, zero, 1             # contador de navios
    
    teste_1:
        # lb t4, 0(a0)            # carrega navios em t4
        # addi t4, t4, -48       # a0/t4 => 3              cod ascci 0/ trasnformar a string 3 em int 3
        beq t4, zero, end_1       # identifica_qtd
    corpo_1:
        la s10, matriz      # carrega matriz em s10
        
        addi a0, a0, 2      # horizontal[0] ou vertical[1]
        lb s0, (a0)         # direcao em s0
        addi s0, s0, -48    # transforma a string em inteiro(ascii)
 
        addi a0, a0, 3      	# numero 3(4) da string
        # addi a0, a0, 1		# ando uma casa em a0 e guardo em s8
        lb s4, (a0)
        bne s4, s7, msg_cpm	    # se a pos em a0(s8) for diferente de space -> msgCpm
        addi a0, a0, -1		    # ando uma casa em a0 e guardo em s8
        lb s1, (a0)		        # salvo a pos de a0 em s1
        addi s1, s1, -48
        

        addi a0, a0, 3          # eu ando at? a posicao depois do numero (que deveria ser um espaco)     
        # addi a0, a0, 1	
        lb s5, (a0)             # salvo em um reg temp
        bne s5, s7, msg_posLin  # teste se ela ? diferente de espa?o
        addi a0, a0, -1		    # volto para a posicao que tem o numero
        lb s2, (a0)		        # salvo em s2
        addi s2, s2, -48        # transformo em int

        addi a0, a0, 3          # eu ando at? a posicao depois do numero (que deveria ser um espaco)         
        # addi a0, a0, 1        	
        lb s6, (a0)             # salvo em um reg temp
        bne s6, s7, msg_posCol  # teste se ela ? diferente de espa?o
        addi a0, a0, -1         # volto para a posicao que tem o numero		
        lb s3, (a0)             # salvo em s3		   
        addi s3, s3, -48        # transformo em int

        # (L * QTD_colunas + C) * 4
        mul s11, s2, t6      # l *qtd colunas
        add s11, s11, s3     # l *qtd colunas + C
        mul s11, s11, t5     # (l *qtd colunas + C) * 4 
        add s10, s10, s11       # s10 esta com a pos atual na matriz
        
        teste_2:
            beq s1, zero, incremento_1		# s8-> count_comprimento. s1 comprimento
        corpo_2:
        	lb t1, 0(s10)                   # ponteiro em t1 para s10
            bne t1, t3, msg_sobrepos        # se a posicao atual for diferente de 0 -> msg_sobrepos
            sw s9, (s10)                    # salva o numero da embarcacao atual na matriz
            
        incremento_2:       
            addi s1, s1, -1	
            beq s0, t3, horizontal		# se s0 = 0 entao ? horizontal
            j vertical				# se nao ? vertical
            horizontal:
                addi s10, s10, 4			# add o n barco de 4 em 4 pos
                # add s5, zero, ra
                # jal funcao
                # add ra, zero, s5
                j teste_2
            vertical:
                addi s10, s10, 40           # add 40 para andar 10 pos na matriz
                j teste_2
       incremento_1:
            addi s9, s9, 1
            addi t4, t4, -1 
            j teste_1
     
        end_1:
            ret
        

# mensagens de erro do programa
        msg_cpm:
            la a0, msgCpm
            li a7, 4
            ecall
            j fim
        msg_posCol:
            la a0, msgPosCol
            li a7, 4
            ecall
            j fim
        msg_posLin:
            la a0, msgPosLin
            li a7, 4
            ecall
            j fim
        msg_sobrepos:
            la a0, msgSobrepos
            li a7, 4
            ecall
            j fim

jogar:
    tiro:




printa_matriz:  # peguei essa funcao do alex
    add t0, zero, zero # quando chegar em 100, termina
    addi t1, zero, 100 
    add t2, zero, zero # a cada 10, um \n
    addi t3, zero, 10
    la a1, matriz
    teste_condicao_prin:
        beq t0, t1, fim_prin
        beq t2, t3, pula_prin
        j corpo_laco_prin
    pula_prin:
        add t2, zero, zero
        li a0, 10
        li a7, 11
        ecall
    corpo_laco_prin:
        lw a0, (a1)
        li a7, 1
        ecall
        li a0, 32       # 32 = space (tabela ascii)
        li a7, 11       # 11 = \n (tabela ascii)
        ecall
    incremento_controle_prin:
        addi a1, a1, 4
        addi t0, t0, 1
        addi t2, t2, 1
        j teste_condicao_prin
    fim_prin:
        ret

tela_inicial:
    display_interatio:
            la a0, interativo
            li a7, 4
            ecall
        endII:
            ret    


fim:
    nop

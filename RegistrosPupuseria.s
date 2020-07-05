/*
Nombre: RegistrosPupuseria.s
Descripcion: Programa para registrar la compras de una pupuseria
AUTORES: 
ALEJANDRO JOSUÉ     MARTÍNEZ LÓPEZ      CARNET: ML16007
CONCEPCIÓN DE MARÍA ORELLANA GINEA      CARNET: OG17007
 */

    .data
//Informacion para el archivo
nuevoarchivo2:       .asciz  "registros.txt"
modo:               .asciz  "a"
//Registro
pruebaT:            .asciz  "Total: %f\n"
pruebaOpcion:       .asciz  "Opcion: %d\n"
pruebaCantidad:     .asciz  "Cantidad: %f\n"
pruebaPrecio:       .asciz  "Precio: %f\n"
//Variables
opcion:             .word   0
bandera:            .word   0
cantidad:           .float  0
precio1:            .float  0.50
precio2:            .float  0.75
precio3:            .float  1.50
numero1:            .word   10
total:                  .double  15
//Formatos
entero:             .asciz  "%d"
flotante:           .asciz  "%f"
//Mensajes
msgcancelar:        .asciz  "Compra cancelada!\n"
msgexito:           .asciz  "Compra realizada con exito!\n"
msgdefault:         .asciz  "Elegir una opcion entre 1 y 7 por favor\n"
msgerrorarchivo:    .asciz  "Error al crear el archivo\n"
msgconfirmacion:    .asciz  "Confirmacion de compra:\n[1] Confirmar\n[0] Cancelar\n"
msgcantidad:        .asciz  "Escriba la cantidad a comprar\n"
msgmenu:            .asciz  "\n        Bienvenido\nEste es el menu de nuestras pupusas:\n[1] F/Q       precio: $0.50;\n[2] REVUELTAS precio: $0.50;\n[3] LOCA      precio: $1.50;\n[4] QUESO     precio: $0.75;\n[5] MORA      precio: $0.50;\n[6] POLLO     precio: $0.75;\n[7] CHILE     precio: $0.75;\nElija una de las opciones (1,2,3...7)\n"
msgseguir:          .asciz  "¿Desea seguir comprando?\n[1] Seguir\n[0] Cancelar\n"
msgerroropcion:     .asciz  "Selecciones una opcion valida entre el 1 y el 7\n"
opcion1:            .asciz  "Pupusa: F/Q, Precio: $0.50 "
len1 =.-opcion1
opcion2:            .asciz  "Pupusa: Revuelta, Precio: $0.50   "
len2 =.-opcion2
opcion3:            .asciz  "Pupusa: Loca,     Precio: $1.50   "
len3 =.-opcion3
opcion4:            .asciz  "Pupusa: Queso,    Precio: $0.75   "
len4 =.-opcion4
opcion5:            .asciz  "Pupusa: Mora,     Precio: $0.50   "
len5 =.-opcion5
opcion6:            .asciz  "Pupusa: Pollo,    Precio: $0.75   "
len6 =.-opcion6
opcion7:            .asciz  "Pupusa: Chile,    Precio: $0.75   "
len7 =.-opcion7
cantidadx:          .asciz  "Cantidad: %f  "
lencantidadx =.-cantidadx
totalx:             .asciz  "Total: $%f\n"
lentotalx =.-totalx
finTransaccion:     .asciz  "\n---------------------------------------------------------------------------------\n\n"
mip1:	.asciz "                     ....  ....  ....  ......\n"
mipr1:	.asciz "                     |   \\/   |  |  |  |     \\ \n"
mip2: 	.asciz "                     |  |\\/|  |  |  |  |  |>  |\n"
mipr2:	.asciz "                     |  |   |  |  |  |  |  ___/\n"
mip3:	.asciz "                     |..|   |..|  |..|  |..|\n\n"
mip4:	.asciz "    [--]            UNIVERSIDAD DE EL SALVADOR            [--]\n"
mip5:	.asciz "    [--]       Facultad de Ingeniería y Arquitectura      [--]\n"
mip6:	.asciz "    [--]     Escuela de Ing. de Sistemas Informáticos     [--]\n"
mip7: 	.asciz "    [--]                  Proyecto:                       [--]\n"
mip8:	.asciz "    [--]       Transacciones de ventas en tienda          [--]\n"
mip9:	.asciz "    [--]                 Creado por:                      [--]\n"
mip10:	.asciz "    [--]    Alejandro Martinez & Concepcion Orellana      [--]\n"
mip11:	.asciz "    [--] .________________________________________________[--]\n"
mip12:	.asciz "    \\_.---------------------------------------------------- /\n"


    
    .text
    .global main
    .func main
main:
    PUSH {LR}
    LDR R0,=mip1
	BL printf
	LDR R0, =mipr1
	BL printf
	LDR R0,=mip2
	BL printf
	LDR R0, =mipr2
	BL printf
	LDR R0,=mip3
	BL printf
	LDR R0, =mip4
	BL printf
	LDR R0, =mip5
	BL printf
	LDR R0, =mip6
	BL printf
	LDR R0, =mip7
	BL printf
	LDR R0, =mip8
	BL printf
	LDR R0, =mip9
	BL printf
	LDR R0, =mip10
	BL printf
	LDR R0, =mip11
	BL printf
	LDR R0, =mip12
	BL printf

    //MOSTRAR MENU Y PEDIR OPCION
    menu:
        LDR R0, =msgmenu
        BL printf
        LDR R0, =entero
        LDR R1, =opcion
        BL scanf
        BAL switch    

    //COMPARAR QUE OPCION ELIGIO
    switch:
        LDR R1, =opcion                                  
        LDR R1, [R1]
        CMP R1, #1                              
        BEQ case1                             
        CMP R1, #2
        BEQ case2
        CMP R1, #3
        BEQ case3
        CMP R1, #4
        BEQ case4                          
        CMP R1, #5
        BEQ case5
        CMP R1, #6
        BEQ case6
        CMP R1, #7
        BEQ case7

    //PEDIR DE NUEVO LA OPCION YA QUE ESCOGIO UNA OPCION INVALIDA    
    caseDefault:
        LDR R0, =msgdefault
        BL printf
        LDR R0, =entero
        LDR R1, =opcion
        BL scanf
        BAL switch
   

    //ASIGNANDO EN R5 EL PRECIO DE LA OPCION SELECCIONADA
    case1:    
        LDR R5, =precio1
        LDR R9, =opcion1
        LDR R10, =len1
        BAL cantidadp
    case2:
        LDR R5, =precio1
        LDR R9, =opcion2
        LDR R10, =len2
        BAL cantidadp
    case3:
        LDR R5, =precio3
        LDR R9, =opcion3
        LDR R10, =len3
        BAL cantidadp
    case4:
        LDR R5, =precio2
        LDR R9, =opcion4
        LDR R10, =len4
        BAL cantidadp
    case5:
        LDR R5, =precio1
        LDR R9, =opcion5
        LDR R10, =len5
        BAL cantidadp
    case6:
        LDR R5, =precio2
        LDR R9, =opcion6
        LDR R10, =len6
        BAL cantidadp
    case7:
        LDR R5, =precio2
        LDR R9, =opcion7
        LDR R10, =len7

 //PEDIR CANTIDAD
    cantidadp:                                  
        LDR R0, =msgcantidad
        BL printf
        LDR R0, =flotante
        LDR R1, =cantidad
        BL scanf
        BAL operaciones
       
    //CONFIRMAR LA COMPRA       
    confirmacion:                               
        LDR R0, =msgconfirmacion
        BL printf
        LDR R0, =entero
        LDR R1, =bandera
        BL scanf
        LDR R1, =bandera
        LDR R1, [R1]                            
        CMP R1, #0  
        BEQ cancelar
        CMP R1, #1
        BEQ exito
        BAL confirmacion

    exito:
        
        PUSH {R0 - R4}

        LDR     R0, =nuevoarchivo2
        LDR     R1, =modo
        BL fopen

        LDR     R1, =totalx
        LDR     R2, =total
        VLDR    D7, [R2]
        VMOV    R2, R3, D7       
        BL fprintf

        LDR     R0, =nuevoarchivo2
        LDR     R1, =modo
        BL fopen

        LDR     R1, =cantidadx
        LDR     R2, =cantidad
        VLDR    S15, [R2]
        VCVT.F64.F32    D7, S15
        VMOV    R2, R3, D7       
        BL fprintf
         
        LDR     R0, =nuevoarchivo2
        LDR     R1, =modo
        BL fopen

        MOV     R1, R9
        BL fprintf

        POP {R0 - R4}

        BAL seguir
    cancelar:
        LDR R0, =msgcancelar
        BL printf
        BAL seguir

//LOGICA
    operaciones:
        //Probar la opcion
        LDR R1, =opcion
        LDR R1, [R1]                                
        LDR R0, =pruebaOpcion
        BL printf

        //Probar el precio
        VLDR S1, [R5]
        VCVT.F64.F32 D1, S1
        VMOV R1, R2, D1
        LDR R0, =pruebaPrecio
        BL printf

        //Probar la cantidad
        LDR R8, =cantidad
        VLDR S1, [R8]
        VCVT.F64.F32 D1, S1
        VMOV R1, R2, D1
        LDR R0, =pruebaCantidad
        BL printf

        LDR R6, =cantidad        
        VLDR S1, [R6]
        VLDR S0, [R5]
        VMUL.F32 S2, S0, S1                     @ compute S2 = S0 * S1
        VCVT.F64.F32 D4, S2                     @ covert the result to double precision for printing
        //VCVT.F64.F32 D5, S0                   @ covert the result to double precision for printing

        //Probar Total
        LDR     R3, =total
        VMOV    R1, R2, D4                         @ split the double VFP register into two ARM registers
        VSTR    D4, [R3]
        //VMOV R3, R4, D4                       @ split the double VFP register into two ARM registers    
        LDR R0, =pruebaT
        BL printf
        BAL confirmacion    

    //registro:                                 //ESCRIBIR REGISTRO EN ARCHIVO

    seguir:                                     //VER SI SE SIGUE COMPRANDO
        LDR R0, =msgseguir
        BL printf
        LDR R0, =entero
        LDR R1, =bandera
        BL scanf
        LDR R1, =bandera
        LDR R1, [R1]                            
        CMP R1, #0  
        BEQ cierreArchivo
        CMP R1, #1
        BEQ menu
        BAL seguir

    cierreArchivo:
        LDR     R0, =nuevoarchivo2
        LDR     R1, =modo
        BL fopen
        LDR     R1, =finTransaccion
        BL fprintf
    
exit:   
    POP {PC}    
    MOV R7, #1
    SWI 0

//POR SI NO SE PUDO CREAR/ABRIR EL ARCHIVO
error:
    LDR R0, =msgerrorarchivo
    BL  printf
    BAL exit
    
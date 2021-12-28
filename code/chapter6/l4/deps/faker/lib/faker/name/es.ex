defmodule Faker.Name.Es do
  import Faker, only: [sampler: 2]

  @moduledoc """
  Functions for name data in Spanish
  """

  @doc """
  Returns a complete name (may include a suffix/prefix or both)

  ## Examples

      iex> Faker.Name.Es.name()
      "Sta. Daniela Agosto MD"
      iex> Faker.Name.Es.name()
      "Alfonso Menéndez"
      iex> Faker.Name.Es.name()
      "Sr. Francisco Jaimes"
      iex> Faker.Name.Es.name()
      "Manuel Lucio MD"
  """
  @spec name() :: String.t()
  def name, do: name(Faker.random_between(0, 9))
  defp name(0), do: "#{prefix()} #{first_name()} #{last_name()} #{suffix()}"
  defp name(1), do: "#{prefix()} #{first_name()} #{last_name()}"
  defp name(2), do: "#{first_name()} #{last_name()} #{suffix()}"

  defp name(n) when is_integer(n) do
    "#{first_name()} #{last_name()}"
  end

  @doc """
  Returns a random first name

  ## Examples

      iex> Faker.Name.Es.first_name()
      "Jorge"
      iex> Faker.Name.Es.first_name()
      "Guillermina"
      iex> Faker.Name.Es.first_name()
      "Daniela"
      iex> Faker.Name.Es.first_name()
      "Armando"
  """
  @spec first_name() :: String.t()
  sampler(:first_name, [
    "Adán",
    "Agustín",
    "Alberto",
    "Alejandro",
    "Alfonso",
    "Alfredo",
    "Andrés",
    "Antonio",
    "Armando",
    "Arturo",
    "Benito",
    "Benjamín",
    "Bernardo",
    "Carlos",
    "César",
    "Claudio",
    "Clemente",
    "Cristian",
    "Cristobal",
    "Daniel",
    "David",
    "Diego",
    "Eduardo",
    "Emilio",
    "Enrique",
    "Ernesto",
    "Esteban",
    "Federico",
    "Felipe",
    "Fernando",
    "Francisco",
    "Gabriel",
    "Gerardo",
    "Germán",
    "Gilberto",
    "Gonzalo",
    "Gregorio",
    "Guillermo",
    "Gustavo",
    "Hernán",
    "Homero",
    "Horacio",
    "Hugo",
    "Ignacio",
    "Jacobo",
    "Jaime",
    "Javier",
    "Jerónimo",
    "Jesús",
    "Joaquín",
    "Jorge",
    "Jorge Luis",
    "José",
    "José Eduardo",
    "José Emilio",
    "José Luis",
    "José María",
    "Juan",
    "Juan Carlos",
    "Julio",
    "Julio César",
    "Lorenzo",
    "Lucas",
    "Luis",
    "Luis Miguel",
    "Manuel",
    "Marco Antonio",
    "Marcos",
    "Mariano",
    "Mario",
    "Martín",
    "Mateo",
    "Miguel",
    "Miguel Ángel",
    "Nicolás",
    "Octavio",
    "Óscar",
    "Pablo",
    "Patricio",
    "Pedro",
    "Rafael",
    "Ramiro",
    "Ramón",
    "Raúl",
    "Ricardo",
    "Roberto",
    "Rodrigo",
    "Rubén",
    "Salvador",
    "Samuel",
    "Sancho",
    "Santiago",
    "Sergio",
    "Teodoro",
    "Timoteo",
    "Tomás",
    "Vicente",
    "Víctor",
    "Adela",
    "Adriana",
    "Alejandra",
    "Alicia",
    "Amalia",
    "Ana",
    "Ana Luisa",
    "Ana María",
    "Andrea",
    "Anita",
    "Ángela",
    "Antonia",
    "Ariadna",
    "Barbara",
    "Beatriz",
    "Berta",
    "Blanca",
    "Caridad",
    "Carla",
    "Carlota",
    "Carmen",
    "Carolina",
    "Catalina",
    "Cecilia",
    "Clara",
    "Claudia",
    "Concepción",
    "Conchita",
    "Cristina",
    "Daniela",
    "Débora",
    "Diana",
    "Dolores",
    "Lola",
    "Dorotea",
    "Elena",
    "Elisa",
    "Eloisa",
    "Elsa",
    "Elvira",
    "Emilia",
    "Esperanza",
    "Estela",
    "Ester",
    "Eva",
    "Florencia",
    "Francisca",
    "Gabriela",
    "Gloria",
    "Graciela",
    "Guadalupe",
    "Guillermina",
    "Inés",
    "Irene",
    "Isabel",
    "Isabela",
    "Josefina",
    "Juana",
    "Julia",
    "Laura",
    "Leonor",
    "Leticia",
    "Lilia",
    "Lorena",
    "Lourdes",
    "Lucia",
    "Luisa",
    "Luz",
    "Magdalena",
    "Manuela",
    "Marcela",
    "Margarita",
    "María",
    "María del Carmen",
    "María Cristina",
    "María Elena",
    "María Eugenia",
    "María José",
    "María Luisa",
    "María Soledad",
    "María Teresa",
    "Mariana",
    "Maricarmen",
    "Marilu",
    "Marisol",
    "Marta",
    "Mayte",
    "Mercedes",
    "Micaela",
    "Mónica",
    "Natalia",
    "Norma",
    "Olivia",
    "Patricia",
    "Pilar",
    "Ramona",
    "Raquel",
    "Rebeca",
    "Reina",
    "Rocio",
    "Rosa",
    "Rosalia",
    "Rosario",
    "Sara",
    "Silvia",
    "Sofia",
    "Soledad",
    "Sonia",
    "Susana",
    "Teresa",
    "Verónica",
    "Victoria",
    "Virginia",
    "Yolanda"
  ])

  @doc """
  Returns a random last name

  ## Examples

      iex> Faker.Name.Es.last_name()
      "Raya"
      iex> Faker.Name.Es.last_name()
      "Cervantes"
      iex> Faker.Name.Es.last_name()
      "Maya"
      iex> Faker.Name.Es.last_name()
      "Agosto"
  """
  @spec last_name() :: String.t()
  sampler(:last_name, [
    "Abeyta",
    "Abrego",
    "Abreu",
    "Acevedo",
    "Acosta",
    "Acuña",
    "Adame",
    "Adorno",
    "Agosto",
    "Aguayo",
    "Águilar",
    "Aguilera",
    "Aguirre",
    "Alanis",
    "Alaniz",
    "Alarcón",
    "Alba",
    "Alcala",
    "Alcántar",
    "Alcaraz",
    "Alejandro",
    "Alemán",
    "Alfaro",
    "Alicea",
    "Almanza",
    "Almaraz",
    "Almonte",
    "Alonso",
    "Alonzo",
    "Altamirano",
    "Alva",
    "Alvarado",
    "Alvarez",
    "Amador",
    "Amaya",
    "Anaya",
    "Anguiano",
    "Angulo",
    "Aparicio",
    "Apodaca",
    "Aponte",
    "Aragón",
    "Araña",
    "Aranda",
    "Arce",
    "Archuleta",
    "Arellano",
    "Arenas",
    "Arevalo",
    "Arguello",
    "Arias",
    "Armas",
    "Armendáriz",
    "Armenta",
    "Armijo",
    "Arredondo",
    "Arreola",
    "Arriaga",
    "Arroyo",
    "Arteaga",
    "Atencio",
    "Ávalos",
    "Ávila",
    "Avilés",
    "Ayala",
    "Baca",
    "Badillo",
    "Báez",
    "Baeza",
    "Bahena",
    "Balderas",
    "Ballesteros",
    "Banda",
    "Bañuelos",
    "Barajas",
    "Barela",
    "Barragán",
    "Barraza",
    "Barrera",
    "Barreto",
    "Barrientos",
    "Barrios",
    "Batista",
    "Becerra",
    "Beltrán",
    "Benavides",
    "Benavídez",
    "Benítez",
    "Bermúdez",
    "Bernal",
    "Berríos",
    "Bétancourt",
    "Blanco",
    "Bonilla",
    "Borrego",
    "Botello",
    "Bravo",
    "Briones",
    "Briseño",
    "Brito",
    "Bueno",
    "Burgos",
    "Bustamante",
    "Bustos",
    "Caballero",
    "Cabán",
    "Cabrera",
    "Cadena",
    "Caldera",
    "Calderón",
    "Calvillo",
    "Camacho",
    "Camarillo",
    "Campos",
    "Canales",
    "Candelaria",
    "Cano",
    "Cantú",
    "Caraballo",
    "Carbajal",
    "Cardenas",
    "Cardona",
    "Carmona",
    "Carranza",
    "Carrasco",
    "Carrasquillo",
    "Carreón",
    "Carrera",
    "Carrero",
    "Carrillo",
    "Carrion",
    "Carvajal",
    "Casanova",
    "Casares",
    "Casárez",
    "Casas",
    "Casillas",
    "Castañeda",
    "Castellanos",
    "Castillo",
    "Castro",
    "Cavazos",
    "Cazares",
    "Ceballos",
    "Cedillo",
    "Ceja",
    "Centeno",
    "Cepeda",
    "Cerda",
    "Cervantes",
    "Cervántez",
    "Chacón",
    "Chapa",
    "Chavarría",
    "Chávez",
    "Cintrón",
    "Cisneros",
    "Collado",
    "Collazo",
    "Colón",
    "Colunga",
    "Concepción",
    "Contreras",
    "Cordero",
    "Córdova",
    "Cornejo",
    "Corona",
    "Coronado",
    "Corral",
    "Corrales",
    "Correa",
    "Cortés",
    "Cortez",
    "Cotto",
    "Covarrubias",
    "Crespo",
    "Cruz",
    "Cuellar",
    "Curiel",
    "Dávila",
    "Delacrúz",
    "Delafuente",
    "Delagarza",
    "Delao",
    "Delapaz",
    "Delarosa",
    "Delatorre",
    "Deleón",
    "Delgadillo",
    "Delgado",
    "Delrío",
    "Delvalle",
    "Díaz",
    "Domínguez",
    "Domínquez",
    "Duarte",
    "Dueñas",
    "Duran",
    "Echevarría",
    "Elizondo",
    "Enríquez",
    "Escalante",
    "Escamilla",
    "Escobar",
    "Escobedo",
    "Esparza",
    "Espinal",
    "Espino",
    "Espinosa",
    "Espinoza",
    "Esquibel",
    "Esquivel",
    "Estévez",
    "Estrada",
    "Fajardo",
    "Farías",
    "Feliciano",
    "Fernández",
    "Ferrer",
    "Fierro",
    "Figueroa",
    "Flores",
    "Flórez",
    "Fonseca",
    "Franco",
    "Frías",
    "Fuentes",
    "Gaitán",
    "Galarza",
    "Galindo",
    "Gallardo",
    "Gallegos",
    "Galván",
    "Gálvez",
    "Gamboa",
    "Gamez",
    "Gaona",
    "Garay",
    "García",
    "Garibay",
    "Garica",
    "Garrido",
    "Garza",
    "Gastélum",
    "Gaytán",
    "Gil",
    "Girón",
    "Godínez",
    "Godoy",
    "Gómez",
    "Gonzales",
    "González",
    "Gollum",
    "Gracia",
    "Granado",
    "Granados",
    "Griego",
    "Grijalva",
    "Guajardo",
    "Guardado",
    "Guerra",
    "Guerrero",
    "Guevara",
    "Guillen",
    "Gurule",
    "Gutiérrez",
    "Guzmán",
    "Haro",
    "Henríquez",
    "Heredia",
    "Hernádez",
    "Hernandes",
    "Hernández",
    "Herrera",
    "Hidalgo",
    "Hinojosa",
    "Holguín",
    "Huerta",
    "Hurtado",
    "Ibarra",
    "Iglesias",
    "Irizarry",
    "Jaime",
    "Jaimes",
    "Jáquez",
    "Jaramillo",
    "Jasso",
    "Jiménez",
    "Jimínez",
    "Juárez",
    "Jurado",
    "Laboy",
    "Lara",
    "Laureano",
    "Leal",
    "Lebrón",
    "Ledesma",
    "Leiva",
    "Lemus",
    "León",
    "Lerma",
    "Leyva",
    "Limón",
    "Linares",
    "Lira",
    "Llamas",
    "Loera",
    "Lomeli",
    "Longoria",
    "López",
    "Lovato",
    "Loya",
    "Lozada",
    "Lozano",
    "Lucero",
    "Lucio",
    "Luevano",
    "Lugo",
    "Luna",
    "Macías",
    "Madera",
    "Madrid",
    "Madrigal",
    "Maestas",
    "Magaña",
    "Malave",
    "Maldonado",
    "Manzanares",
    "Mares",
    "Marín",
    "Márquez",
    "Marrero",
    "Marroquín",
    "Martínez",
    "Mascareñas",
    "Mata",
    "Mateo",
    "Matías",
    "Matos",
    "Maya",
    "Mayorga",
    "Medina",
    "Medrano",
    "Mejía",
    "Meléndez",
    "Melgar",
    "Mena",
    "Menchaca",
    "Méndez",
    "Mendoza",
    "Menéndez",
    "Meraz",
    "Mercado",
    "Merino",
    "Mesa",
    "Meza",
    "Miramontes",
    "Miranda",
    "Mireles",
    "Mojica",
    "Molina",
    "Mondragón",
    "Monroy",
    "Montalvo",
    "Montañez",
    "Montaño",
    "Montemayor",
    "Montenegro",
    "Montero",
    "Montes",
    "Montez",
    "Montoya",
    "Mora",
    "Morales",
    "Moreno",
    "Mota",
    "Moya",
    "Munguía",
    "Muñiz",
    "Muñoz",
    "Murillo",
    "Muro",
    "Nájera",
    "Naranjo",
    "Narváez",
    "Nava",
    "Navarrete",
    "Navarro",
    "Nazario",
    "Negrete",
    "Negrón",
    "Nevárez",
    "Nieto",
    "Nieves",
    "Niño",
    "Noriega",
    "Núñez",
    "Ocampo",
    "Ocasio",
    "Ochoa",
    "Ojeda",
    "Olivares",
    "Olivárez",
    "Olivas",
    "Olivera",
    "Olivo",
    "Olmos",
    "Olvera",
    "Ontiveros",
    "Oquendo",
    "Ordóñez",
    "Orellana",
    "Ornelas",
    "Orosco",
    "Orozco",
    "Orta",
    "Ortega",
    "Ortiz",
    "Osorio",
    "Otero",
    "Ozuna",
    "Pabón",
    "Pacheco",
    "Padilla",
    "Padrón",
    "Páez",
    "Pagan",
    "Palacios",
    "Palomino",
    "Palomo",
    "Pantoja",
    "Paredes",
    "Parra",
    "Partida",
    "Patiño",
    "Paz",
    "Pedraza",
    "Pedroza",
    "Pelayo",
    "Peña",
    "Perales",
    "Peralta",
    "Perea",
    "Peres",
    "Pérez",
    "Pichardo",
    "Piña",
    "Pineda",
    "Pizarro",
    "Polanco",
    "Ponce",
    "Porras",
    "Portillo",
    "Posada",
    "Prado",
    "Preciado",
    "Prieto",
    "Puente",
    "Puga",
    "Pulido",
    "Quesada",
    "Quezada",
    "Quiñones",
    "Quiñónez",
    "Quintana",
    "Quintanilla",
    "Quintero",
    "Quiroz",
    "Rael",
    "Ramírez",
    "Ramón",
    "Ramos",
    "Rangel",
    "Rascón",
    "Raya",
    "Razo",
    "Regalado",
    "Rendón",
    "Rentería",
    "Reséndez",
    "Reyes",
    "Reyna",
    "Reynoso",
    "Rico",
    "Rincón",
    "Riojas",
    "Ríos",
    "Rivas",
    "Rivera",
    "Rivero",
    "Robledo",
    "Robles",
    "Rocha",
    "Rodarte",
    "Rodrígez",
    "Rodríguez",
    "Rodríquez",
    "Rojas",
    "Rojo",
    "Roldán",
    "Rolón",
    "Romero",
    "Romo",
    "Roque",
    "Rosado",
    "Rosales",
    "Rosario",
    "Rosas",
    "Roybal",
    "Rubio",
    "Ruelas",
    "Ruiz",
    "Saavedra",
    "Sáenz",
    "Saiz",
    "Salas",
    "Salazar",
    "Salcedo",
    "Salcido",
    "Saldaña",
    "Saldivar",
    "Salgado",
    "Salinas",
    "Samaniego",
    "Sanabria",
    "Sanches",
    "Sánchez",
    "Sandoval",
    "Santacruz",
    "Santana",
    "Santiago",
    "Santillán",
    "Sarabia",
    "Sauceda",
    "Saucedo",
    "Sedillo",
    "Segovia",
    "Segura",
    "Sepúlveda",
    "Serna",
    "Serrano",
    "Serrato",
    "Sevilla",
    "Sierra",
    "Sisneros",
    "Solano",
    "Solís",
    "Soliz",
    "Solorio",
    "Solorzano",
    "Soria",
    "Sosa",
    "Sotelo",
    "Soto",
    "Suárez",
    "Tafoya",
    "Tamayo",
    "Tamez",
    "Tapia",
    "Tejada",
    "Tejeda",
    "Téllez",
    "Tello",
    "Terán",
    "Terrazas",
    "Tijerina",
    "Tirado",
    "Toledo",
    "Toro",
    "Torres",
    "Tórrez",
    "Tovar",
    "Trejo",
    "Treviño",
    "Trujillo",
    "Ulibarri",
    "Ulloa",
    "Urbina",
    "Ureña",
    "Urías",
    "Uribe",
    "Urrutia",
    "Vaca",
    "Valadez",
    "Valdés",
    "Valdez",
    "Valdivia",
    "Valencia",
    "Valentín",
    "Valenzuela",
    "Valladares",
    "Valle",
    "Vallejo",
    "Valles",
    "Valverde",
    "Vanegas",
    "Varela",
    "Vargas",
    "Vásquez",
    "Vázquez",
    "Vega",
    "Vela",
    "Velasco",
    "Velásquez",
    "Velázquez",
    "Vélez",
    "Véliz",
    "Venegas",
    "Vera",
    "Verdugo",
    "Verduzco",
    "Vergara",
    "Viera",
    "Vigil",
    "Villa",
    "Villagómez",
    "Villalobos",
    "Villalpando",
    "Villanueva",
    "Villareal",
    "Villarreal",
    "Villaseñor",
    "Villegas",
    "Yáñez",
    "Ybarra",
    "Zambrano",
    "Zamora",
    "Zamudio",
    "Zapata",
    "Zaragoza",
    "Zarate",
    "Zavala",
    "Zayas",
    "Zelaya",
    "Zepeda",
    "Zúñiga"
  ])

  @doc """
  Returns a random prefix

  ## Examples

      iex> Faker.Name.Es.prefix()
      "Sr."
      iex> Faker.Name.Es.prefix()
      "Sta."
      iex> Faker.Name.Es.prefix()
      "Sr."
      iex> Faker.Name.Es.prefix()
      "Sta."
  """
  @spec prefix() :: String.t()
  sampler(:prefix, [
    "Sr.",
    "Sra.",
    "Sta."
  ])

  @doc """
  Returns a random suffix

  ## Examples

      iex> Faker.Name.Es.suffix()
      "II"
      iex> Faker.Name.Es.suffix()
      "V"
      iex> Faker.Name.Es.suffix()
      "V"
      iex> Faker.Name.Es.suffix()
      "V"
  """
  @spec suffix() :: String.t()
  sampler(:suffix, [
    "Jr.",
    "Sr.",
    "I",
    "II",
    "III",
    "IV",
    "V",
    "MD",
    "DDS",
    "PhD",
    "DVM"
  ])
end

<?php	
include('../db.php');
$nombre = '';
$nacimiento = '';
$nacionalidad = '';
$descripcion = '';

$countries = array("Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");

//Se llaman a la BD los datos del ID correspondiente
if  (isset($_GET['id'])) {
    $id = $_GET['id'];
  
    $query = "SELECT * FROM autores WHERE id=$id";
  
    $result = mysqli_query($conn, $query);
  
    if (mysqli_num_rows($result) == 1) {
      $row = mysqli_fetch_array($result);
  
      $nombre = $row['nombre'];
      $descripcion = $row['descripcion'];
    }
  }

if (isset($_POST['save'])) {
    $nombre = $_POST['nombre'];
    $nacimiento = $_POST['nacimiento'];
    $nacionalidad = $_POST['nacionalidad'];
    $descripcion = $_POST['descripcion'];

    $query = "UPDATE autores set nombre = '$nombre',
    nacimiento = '$nacimiento', nacionalidad = '$nacionalidad', descripcion = '$descripcion' WHERE id=$id";

    $result = mysqli_query($conn, $query);

    if(!$result) {
        die("Operación fallida");
    }

    header('Location: ../Autores.php');
  }

include('includes/head.php');
include('includes/navbar.php');

?>

<h1 class="display-4 text-center mt-5">Editar Autor</h1>

<form class="form" id="autores_form" action="edit_autor.php?id=<?php echo $_GET['id']; ?>" method="POST">
        <div class="left-section">
            <div class="form-item">
                <label for="nombre">Nombre del Autor:</label>
                <input type="text" id="nombre" name="nombre" required minlength="2" value="<?php echo $nombre; ?>">
            </div>
            <div class="form-item">
                <label for="nacimiento">Nacimiento:</label>
                <input type="date" id="nacimiento" name="nacimiento" required>
            </div>
            <input type="submit" name="save" value="Guardar Información"/>
            <input type ="reset" value="Limpiar">
        </div>
        <div class="right-section">
            <div class="form-item">
                <div class="form-item">
                <label for="nacionalidad">Nacionalidad:</label>
                    <select name="nacionalidad">
                        <option value='' >Seleccione país</option>
                        <?php
                        foreach($countries as $country) { 
                           echo "<option value='$country'>$country</option>";
                        } ?>
                    </select>
                </div>
                <div class="form-item">
                    <label for="descripcion">Información adicional:</label>
                    <textarea name="descripcion" form="autores_form" value="<?php echo $descripcion; ?>">Información del autor...</textarea>
                </div>
            </div>
        </div>
    </form>

<?php
include('../includes/footer.php')
?>
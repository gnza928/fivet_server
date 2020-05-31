/*
 * MIT License
 *
 * Copyright (c) 2020 Diego Urrutia-Astorga <durrutia@ucn.cl>.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

// https://doc.zeroc.com/ice/3.7/language-mappings/java-mapping/client-side-slice-to-java-mapping/customizing-the-java-mapping
["java:package:cl.ucn.disc.pdis.fivet.zeroice", "cs:namespace:Fivet.ZeroIce"]
module model {

    /**
     * The Persona.
     */
    ["cs:property"]
    class Persona {

        /**
         * Primary Key.
         */
        int uid;

        /**
         * Rut: 815184009.
         */
        string rut;

        /**
         * Nombre.
         */
        string nombre;

        /**
         * Apellido.
         */
        string apellido;

        /**
         * Direccion.
         */
        string direccion;

        /**
         * Telefono fijo: +56 55 2355000
         */
        long telefonoFijo;

        /**
         * Telefono movil: +569 8123 1234
         */
        long telefonoMovil;

        /**
         * Correo electronico.
         */
        string email;

    }

    /**
     * The Sexo.
     */
    enum Sexo { MACHO, HEMBRA }

    /**
     * The Tipo of Paciente.
     */
    enum TipoPaciente { INTERNO, EXTERNO }

    /**
     * The Ficha.
     */
    ["cs:property"]
    class Ficha {

        /**
         * Primary Key.
         */
        int uid;

        /**
         * Numero: 1554.
         */
        int numero;

        /**
         * Nombre: Firulay.
         */
        string nombre;

        /**
         * Especie: Canino.
         */
        string especie;

        /**
         * Fecha de Nacimiento.
         * Format: ISO_ZONED_DATE_TIME
         */
        string fechaNacimiento;

        /**
         * Raza: Rottweiler.
         */
        string raza;

        /**
         * Color: rojo cobrizo.
         */
        string color;

        /**
         * Sexo: macho / hembra.
         */
        Sexo sexo;

        /**
         * TipoPaciente: interno/externo.
         */
        TipoPaciente tipoPaciente;
    }

    /**
     * The Control.
     */
    ["cs:property"] 
    class Control {

        /**
         * PK.
         */
        int uid;

        /**
         * Fecha.
         * Format: ISO_ZONED_DATE_TIME
         */
        string fecha;

        /**
         * Fecha proximo control.
         * Format: ISO_ZONED_DATE_TIME
         */
        string fechaProximoControl;

        /**
         * Temperatura.
         */
        float temperatura;

        /**
         * Peso.
         */
        float peso;

        /**
         * Altura.
         */
        float altura;

        /**
         * Diagnostico.
         */
        string diagnostico;

    }

    /**
     * The Contratos.
     */
    interface Contratos {

        /**
         * Deseo registrar los datos de un paciente.
         *
         * @param ficha a crear en el backend.
         * @return the ficha almacenada en el backend (con numero asignado).
         */
        Ficha crearFicha(Ficha ficha);

        /**
         * Deseo registrar los datos del duenio de un paciente.
         *
         * @param persona a crear en el backend.
         * @return the Persona almacenada en el backend.
         */
        Persona crearPersona(Persona persona);

        /**
         * Deseo registrar los datos de un Control.
         *
         * @param numeroFicha al cual sera asignado el control.
         * @param control a agregar.
         */
        Control crearControl(int numeroFicha, Control control);

        /**
         * Dado un numero de ficha, retorna la ficha asociada.
         *
         * @param numero de la ficha a obtener.
         * @return the Ficha.
         */
        Ficha obtenerFicha(int numero);

        /**
         * Dado un numero de rut obtiene la persona.
         *
         * @param rut de la persona a buscar.
         * @return the Persona.
         */
        Persona obtenerPersona(string rut);

    }

    /**
     * The base system.
     */
     interface TheSystem {

        /**
         * @return the diference in time between client and server.
         */
        long getDelay(long clientTime);

     }

}

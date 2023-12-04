import { LightningElement} from 'lwc';
export default class TodoItem extends LightningElement {
    address={
        city:'Melbourne',
        postcode:3008,
        country:'Australia'
    }
    cityVar = ''
    countryVat = ''
    postcodeVar = ''

    setCountry(event) {
            this.countryVar = event.target.value;
    }
    setCity(event) {
        this.cityVar = event.target.value;
    }
    setPostCode(event) {
        this.postCodeVar = event.target.value;
    }

    changeName(event) {
        this.address.country = this.countryVar
        this.address = {...this.address,"city":this.cityVar}
        this.address.postcode = this.postCodeVar
    }

    // getter example
    users = ["John", "Smith", "Nick"]
    num1 = 10
    num2 = 20


    get firstUser() {
        return this.users[0]
    }

    get multiple() {
        return this.num1*this.num2
    }


}
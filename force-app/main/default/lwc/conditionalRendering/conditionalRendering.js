import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    isVisible = false;
    btnVisible = true;

    showData() {
        this.isVisible = !this.isVisible;
        this.btnVisible = !this.btnVisible
    };

  
}
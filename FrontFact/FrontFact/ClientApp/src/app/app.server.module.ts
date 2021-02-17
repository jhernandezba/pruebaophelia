import { NgModule } from '@angular/core';
import { ServerModule } from '@angular/platform-server';
import { ModuleMapLoaderModule } from '@nguniversal/module-map-ngfactory-loader';
import { AppComponent } from './app.component';
import { AppModule } from './app.module';
import { DxButtonModule } from 'devextreme-angular';

@NgModule({
    imports: [AppModule, ServerModule, ModuleMapLoaderModule, DxButtonModule],
    bootstrap: [AppComponent]
})
export class AppServerModule { }

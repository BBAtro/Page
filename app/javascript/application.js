// Entry point for the build script in your package.json
//= require trix
//= require actiontext
import "trix"
import "@rails/actiontext"
import Rails from '@rails/ujs';
import * as ActiveStorage from "@rails/activestorage"

Rails.start();
ActiveStorage.start();
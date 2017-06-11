<?php
/**
 * @file
 * Distribution profile file.
 */

use Drupal\contact\Entity\ContactForm;
use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter().
 */
function bricky_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  $form['#submit'][] = 'bricky_form_install_configure_submit';
}

/**
 * Submission handler to sync the contact.form.feedback recipient.
 */
function bricky_form_install_configure_submit($form, FormStateInterface $form_state) {
  ContactForm::load('feedback')
    ->setRecipients([$form_state->getValue('site_mail')])
    ->trustData()
    ->save();
}

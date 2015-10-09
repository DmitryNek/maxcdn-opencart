<?php

/**
 * @author: Dmitry Shkoliar @DrmitryNek
 * @project: maxcdn-opencart
 * @file: admin/controller/module/maxcdn.php
 */
class ControllerModuleMaxCDN extends Controller
{

    protected $data = array();
    protected $error = array();

    public function index()
    {

        $this->load->language('module/maxcdn');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $data = array();

            foreach ($this->request->post as $key => $value) {
                $data['maxcdn_' . $key] = $value;
            }

            $this->model_setting_setting->editSetting('maxcdn', $data);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_domain'] = $this->language->get('entry_domain');
        $this->data['entry_images'] = $this->language->get('entry_images');
        $this->data['entry_js'] = $this->language->get('entry_js');
        $this->data['entry_css'] = $this->language->get('entry_css');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } else {
            $this->data['status'] = $this->config->get('maxcdn_status');
        }

        if (isset($this->request->post['domain'])) {
            $this->data['domain'] = $this->request->post['domain'];
        } else {
            $this->data['domain'] = $this->config->get('maxcdn_domain');
        }

        if (isset($this->request->post['images'])) {
            $this->data['images'] = $this->request->post['images'];
        } else {
            $this->data['images'] = $this->config->get('maxcdn_images');
        }

        if (isset($this->request->post['js'])) {
            $this->data['js'] = $this->request->post['js'];
        } else {
            $this->data['js'] = $this->config->get('maxcdn_js');
        }

        if (isset($this->request->post['css'])) {
            $this->data['css'] = $this->request->post['css'];
        } else {
            $this->data['css'] = $this->config->get('maxcdn_css');
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_modules'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/maxcdn', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['action'] = $this->url->link('module/maxcdn', 'token=' . $this->session->data['token'], 'SSL');

        if (method_exists($this, 'render')) {
            $this->template = 'module/maxcdn.tpl';
            $this->children = array(
                'common/header',
                'common/footer',
            );

            $this->response->setOutput($this->render());
        } else {
            $this->data['header'] = $this->load->controller('common/header');
            $this->data['column_left'] = $this->load->controller('common/column_left');
            $this->data['footer'] = $this->load->controller('common/footer');

            $this->response->setOutput($this->load->view('module/maxcdn.tpl', $this->data));
        }
    }

    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/maxcdn')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        return !$this->error;
    }

    protected function redirect($url, $status = 302)
    {
        if (method_exists(get_parent_class($this), 'redirect')) {
            parent::redirect($url, $status);
        } else {
            $this->response->redirect($url, $status);
        }
    }

}
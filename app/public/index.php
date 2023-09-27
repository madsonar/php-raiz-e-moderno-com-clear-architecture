<?php

require_once dirname(dirname(__DIR__)) . '/vendor/autoload.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\RequestContext;
use Symfony\Component\Routing\Matcher\UrlMatcher;
use Symfony\Component\Routing\Exception\ResourceNotFoundException;
use App\Application\Routing\Routes;

$request = Request::createFromGlobals();
$routes = Routes::getRoutes();

$context = new RequestContext();
$context->fromRequest($request);

$matcher = new UrlMatcher($routes, $context);

try {
    $attributes = $matcher->match($request->getPathInfo());
    $controller = $attributes['_controller'];
    unset($attributes['_controller']);
    
    if (is_callable($controller)) {
        $response = $controller();
    } else {
        list($class, $method) = $controller;
        $object = new $class();
        $response = $object->$method();
    }
} catch (ResourceNotFoundException $e) {
    $response = new Response('Not Found', 404);
} catch (Exception $e) {
    $response = new Response('An error occurred', 500);
}

$response->send();
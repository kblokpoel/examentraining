<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\GenreRepository;
use App\Entity\Genre;
use App\Entity\Serie;



class MainController extends AbstractController
{
    #[Route('/main', name: 'app_main')]
    public function index(EntityManagerInterface $EntityManagerInterface ) : Response
    {
    $genre = $EntityManagerInterface->getRepository (Genre::class)->findAll();
    return $this->render('main/index.html.twig',['genre' => $genre, ] );
    
    }

    #[Route('/genre/{id}', name: 'app_genre')]
    public function showgenre(EntityManagerInterface $EntityManagerInterface, int $id ) : Response
    {
    $genre = $EntityManagerInterface->getRepository (Genre::class)->find($id);
    $series = $genre->getSeries(Serie::class);
    return $this->render('main/genres.html.twig',
    ['genre' => $genre,
    'series' => $series, ],);
    }

    #[Route('/episodes/{id}', name: 'app_episodes')]
    public function showepisode(EntityManagerInterface $EntityManagerInterface, int $id ) : Response
    {
    $serie = $EntityManagerInterface->getRepository (Serie::class)->find($id);
    $episodes = $serie->getEpisodes(Episode::class);
    return $this->render('main/episodes.html.twig',
    ['serie' => $serie,
    'episodes' => $episodes, ],);
    }
}


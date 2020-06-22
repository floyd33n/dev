module Posts exposing (main)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, href, src)
import Page
import Post


main : Elmstatic.Layout
main =
    let
        postItem post =
          article [ class "article-card" ]
            [ div [ class "card-header" ]
              [ figure [ class "card-thumbnail" ]
                [ img [ Attr.src ("/img/thumbnails/" ++ (String.dropLeft 6 post.link) ++ "_thumbnail.png")
                      , Attr.alt ""
                      ] 
                      []
                ]
              , a [ href ("/" ++ post.link)  ] [ h1 [] [ text post.title ] ]
              ]
            , div [ class "card-body" ] []
            , div [ class "card-footer" ]
              [ Post.metadataHtml post ]
            ]

        postListContent posts =
            if List.isEmpty posts then
                [ text "No posts yet!" ]

            else
                List.map postItem posts

        sortPosts posts =
            List.sortBy .date posts
                |> List.reverse
    in
    Elmstatic.layout Elmstatic.decodePostList <|
        \content ->
            Ok <| Page.layout content.title <| postListContent <| sortPosts content.posts

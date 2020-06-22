module Styles exposing (styles)

import Css exposing (..)
import Css.Global exposing (..)
import Css.Media as Media exposing (..)
import Html exposing (Html)
import Html.Styled


styles : Html msg
styles =
    let
        wideScreen =
            withMedia [ only screen [ Media.minWidth <| Css.px 600 ] ]

        codeStyle =
            [ fontFamilies [ "Inconsolata", .value monospace ]
            ]

        smartphoneScreen =
            withMedia [ only screen [ Media.maxWidth <| Css.px 480 ] ]

        tabletScreen =
            withMedia [ only screen [ Media.maxWidth <| Css.px 1024 ] ]
    in
    global
        [ body
            [ padding <| px 0
            , margin <| px 0
            , backgroundColor <| hex "eaf4fc"
            , Css.color <| hex "363636"
            , fontFamilies [ "Open Sans", "Arial", .value sansSerif ]
            , fontSize <| px 18
            , lineHeight <| Css.em 1.4
            , displayFlex
            , flexFlow1 column
            , Css.minHeight <| vh 100
            , Css.width <| pct 100
            ]
        , a
            [ Css.color <| hex "2a83a2"
            , textDecoration none
            ]
        , code codeStyle
        , Css.Global.pre
            [ descendants
                [ code [ important <| overflowX Css.scroll ] ]
            ]
        , each [ h1, h2, h3, h4, h5, h6 ]
            [ fontFamilies [ "Proza Libre", "Helvetica", .value sansSerif ]
            , lineHeight <| Css.em 1.1
            ]
        , h1 [ fontSize <| Css.em 2.66667, marginBottom <| rem 2.0202 ]
        , h2 [ fontSize <| Css.em 2.0, marginBottom <| rem 1.61616 ]
        , h3 [ fontSize <| Css.em 1.33333, marginBottom <| rem 1.21212 ]
        , h4 [ fontSize <| Css.em 1.2, marginBottom <| rem 0.80808 ]
        , each [ h5, h6 ] [ fontSize <| Css.em 1.0, marginBottom <| rem 0.60606 ]
        , p [ margin3 auto auto (rem 1.5) ]
        , Css.Global.small [ fontSize <| pct 65 ]

        -- header
        , header
            [ Css.height <| px 100
            , Css.width <| pct 100
            , backgroundColor <| hex "393f4c"
            , borderBottom3 (px 2) solid (hex "2ca9e1")
            , displayFlex
            , descendants
                [ class "header-site-title"
                    [ Css.fontSize <| px 20
                    , Css.color <| hex "fff"
                    , marginRight auto
                    , descendants [ h1 [ lineHeight <| px 40 ] ]
                    ]
                , class "header-navigation"
                    [ textAlign center
                    , padding <| px 10
                    , marginTop <| px -20
                    , descendants
                        [ ul
                            [ margin <| px 0
                            , padding <| px 0
                            , wideScreen [ lineHeight <| px 100 ]
                            ]
                        , li
                            [ display inlineBlock
                            , marginRight <| px 20
                            ]
                        ]
                    , wideScreen [ marginTop <| px 0, padding <| px 0, textAlign right ]
                    ]
                ]
            ]
        , class "content" [ Css.maxWidth <| vw 100 ]
        -- footer
        , footer
            [ textAlign center
            , borderTop3 (px 2) solid (hex "2f4858")
            , backgroundColor <| hex "393f4c"
            , Css.color <| hex "fff"
            , descendants
                [ a [ Css.color <| hex "fff", textDecoration none ]
                ]
            , marginTop auto
            ]
        -- main
        , class "main" 
          [ flexGrow (num 1)
          , margin2 (px 0) auto
          , Css.maxWidth <| px 1200
          , displayFlex
          , flexFlow1 column
          , alignItems center
          ]
        -- article
        , class "article-container"
          [ displayFlex
          , Css.height <| pct 100
          , Css.width <| pct 100
          , flexWrap wrap
          , justifyContent spaceBetween
          ]
        -- article-card
        , class "article-card"
          [ Css.width <| pct 25
          , Css.backgroundColor <| hex "f7fcfe"
          , borderRadius <| px 5
          , Css.boxShadow4 (px 0) (px 2) (px 5) (hex "ccc")
          , marginBottom (px 30)
          , Css.minWidth <| px 280
          , Css.padding <| px 10
          , margin2 (px 30) (px 20)
          ]
        , class "card-header"
          [ descendants [ typeSelector "h1" [ fontSize <| Css.em 1.3 ] ] ]
        , class "card-thumbnail"
          [ margin (px 0)
          , descendants [ typeSelector "img" [ Css.width <| pct 100 ] ]
          ]
        , class "article-container.article-content" [ flexFlow1 column ]
        , class "post-metadata"
            [ marginTop <| Css.em -0.5
            , marginBottom <| Css.em 2.0
            , descendants
                [ each [ a, span ]
                    [ display inlineBlock
                    , marginRight <| px 5
                    ]
                , a
                    [ border3 (px 1) solid (hex "e0e0e0")
                    , borderRadius <| px 3
                    , backgroundColor <| hex "f2fae8"
                    , paddingLeft <| px 5
                    , paddingRight <| px 5
                    ]
                ]
            ]
        ]
        |> Html.Styled.toUnstyled

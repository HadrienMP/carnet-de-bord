module Domain.PoleEmploi.ContraintePersonnelle exposing (ContraintePersonnelle(..), all, icon, parse, print)

import Svg exposing (Svg, path, svg)
import Svg.Attributes as SvgAttr


type ContraintePersonnelle
    = Mobilite
    | ContraintesFamiliales
    | Sante
    | MaitriseLangue
    | Logement
    | DifficulteFinanciere
    | DifficulteAdministrative


parse : String -> Maybe ContraintePersonnelle
parse key =
    case key of
        "Développer sa mobilité" ->
            Just Mobilite

        "Surmonter ses contraintes familiales" ->
            Just ContraintesFamiliales

        "Prendre en compte son état de santé" ->
            Just Sante

        "Développer ses capacités en lecture, écriture et calcul" ->
            Just MaitriseLangue

        "Faire face à des difficultés de logement" ->
            Just Logement

        "Faire face à des difficultés financières" ->
            Just DifficulteFinanciere

        "Faire face à des difficultés administratives ou juridiques" ->
            Just DifficulteAdministrative

        _ ->
            Nothing


all : List ContraintePersonnelle
all =
    next [] |> List.reverse


next : List ContraintePersonnelle -> List ContraintePersonnelle
next list =
    case list of
        [] ->
            next [ Mobilite ]

        Mobilite :: _ ->
            next (ContraintesFamiliales :: list)

        ContraintesFamiliales :: _ ->
            next (Sante :: list)

        Sante :: _ ->
            next (MaitriseLangue :: list)

        MaitriseLangue :: _ ->
            next (Logement :: list)

        Logement :: _ ->
            next (DifficulteFinanciere :: list)

        DifficulteFinanciere :: _ ->
            next (DifficulteAdministrative :: list)

        DifficulteAdministrative :: _ ->
            list


print : ContraintePersonnelle -> String
print contrainte =
    case contrainte of
        Mobilite ->
            "Mobilité"

        ContraintesFamiliales ->
            "Contraintes familiales"

        Sante ->
            "Santé"

        MaitriseLangue ->
            "Maîtrise de la langue"

        Logement ->
            "Logement"

        DifficulteFinanciere ->
            "Difficultés financières"

        DifficulteAdministrative ->
            "Difficultés administratives"


icon : ContraintePersonnelle -> Svg msg
icon contrainte =
    case contrainte of
        Mobilite ->
            carIcon

        ContraintesFamiliales ->
            familyIcon

        Sante ->
            heartBeatIcon

        MaitriseLangue ->
            languageIcon

        Logement ->
            homeIcon

        DifficulteFinanciere ->
            eurosIcon

        DifficulteAdministrative ->
            paperworkIcon


heartBeatIcon : Svg msg
heartBeatIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ path
            [ SvgAttr.opacity "0.964"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M56.75 30.626C56.75 31.0479 56.75 31.4698 56.75 31.8917C56.4913 32.4798 56.0343 32.8137 55.3789 32.8936C54.2523 32.9113 53.1273 32.9641 52.0039 33.0518C50.4781 36.071 48.562 38.8132 46.2559 41.2784C42.6765 44.9705 38.7565 48.2225 34.4961 51.0342C33.6123 51.5816 32.6983 52.0739 31.7539 52.5108C29.7575 53.1332 27.8942 52.8519 26.1641 51.6671C20.7992 48.3433 16.0004 44.318 11.7676 39.5909C9.75593 37.331 8.12116 34.8174 6.86328 32.0499C5.80239 32.0389 4.7477 31.9686 3.69922 31.8389C3.25781 31.6609 2.94141 31.3621 2.75 30.9425C2.75 30.5206 2.75 30.0987 2.75 29.6768C2.94141 29.2572 3.25781 28.9584 3.69922 28.7803C4.36718 28.7452 5.03516 28.71 5.70312 28.6749C4.04734 23.5235 4.59226 18.6192 7.33789 13.962C10.7223 9.23441 15.3102 7.31839 21.1016 8.21394C24.6629 9.01845 27.5458 10.8642 29.75 13.751C33.3333 9.06937 38.0442 7.25883 43.8828 8.31941C50.3075 9.99754 53.9111 14.1284 54.6934 20.712C54.831 23.7709 54.3915 26.7416 53.375 29.6241C54.1484 29.6592 54.9219 29.6944 55.6953 29.7296C56.1968 29.8626 56.5483 30.1615 56.75 30.626ZM17.5156 11.2198C22.8278 11.1769 26.5016 13.6026 28.5371 18.4971C29.4414 19.1169 30.2851 19.0465 31.0684 18.2862C33.4122 12.9568 37.4727 10.6893 43.25 11.4835C48.6363 13.0727 51.3785 16.6938 51.4766 22.3468C51.3922 24.8112 50.8825 27.1843 49.9473 29.4659C48.8814 29.6052 47.7916 29.6756 46.6777 29.6768C45.6054 29.6417 44.5332 29.6065 43.4609 29.5714C42.5754 26.2291 41.6789 22.8893 40.7715 19.5518C40.2406 18.7539 39.5199 18.5253 38.6094 18.8663C37.9644 19.2574 37.5953 19.8374 37.502 20.6065C36.077 25.5683 34.6355 30.5253 33.1777 35.4776C32.524 33.4813 31.8912 31.4774 31.2793 29.4659C31.086 28.9913 30.752 28.6573 30.2773 28.4639C28.7754 28.4454 27.2812 28.3926 25.7949 28.3057C24.7942 25.2521 23.8099 22.1935 22.8418 19.13C22.3543 17.9994 21.5281 17.6654 20.3633 18.128C20.0539 18.3668 19.8254 18.6657 19.6777 19.0245C18.5906 22.2509 17.4831 25.4677 16.3555 28.6749C13.9299 28.7276 11.5042 28.7452 9.07812 28.7276C8.10739 25.8717 7.84372 22.9538 8.28711 19.9737C9.5089 15.0775 12.5851 12.1596 17.5156 11.2198ZM21.1016 24.9307C21.8387 26.7367 22.4891 28.5999 23.0527 30.5206C23.2564 31.111 23.6607 31.4801 24.2656 31.628C25.6974 31.6466 27.1212 31.6993 28.5371 31.7862C29.6204 35.3171 30.7453 38.8328 31.9121 42.3331C32.4312 42.829 33.0464 42.9872 33.7578 42.8077C34.1424 42.6942 34.4412 42.4656 34.6543 42.1221C36.1824 36.9589 37.6941 31.7909 39.1895 26.6182C39.6944 28.2507 40.1514 29.903 40.5605 31.5753C40.7312 32.3435 41.2058 32.783 41.9844 32.8936C44.0938 32.9287 46.2031 32.964 48.3125 32.9991C45.1104 38.065 41.0674 42.3541 36.1836 45.8663C34.4445 47.1052 32.6516 48.2654 30.8047 49.3467C30.3627 49.5367 29.9056 49.6069 29.4336 49.5577C28.7044 49.2633 28.0012 48.9118 27.3242 48.503C22.2137 45.265 17.661 41.345 13.666 36.7432C12.4849 35.2784 11.4478 33.714 10.5547 32.0499C12.9453 32.0148 15.3359 31.9795 17.7266 31.9444C18.4135 31.8558 18.8881 31.4867 19.1504 30.837C19.8124 28.8684 20.4628 26.8996 21.1016 24.9307Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        ]


eurosIcon : Svg msg
eurosIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ Svg.g
            [ SvgAttr.clipPath "url(#clip0_3896_183447)"
            ]
            [ path
                [ SvgAttr.opacity "0.939"
                , SvgAttr.fillRule "evenodd"
                , SvgAttr.clipRule "evenodd"
                , SvgAttr.d "M59.9414 33.8086C59.9414 34.5117 59.9414 35.2149 59.9414 35.918C59.6393 36.9674 59.0534 37.8463 58.1836 38.5547C52.2104 42.7528 46.1167 46.7762 39.9023 50.625C38.3018 51.6011 36.6221 52.4214 34.8633 53.086C34.3627 53.2212 33.8548 53.3189 33.3398 53.3789C26.4567 52.2913 19.6208 50.9632 12.832 49.3946C12.7346 50.1337 12.6761 50.8759 12.6562 51.6211C12.3227 52.8531 11.522 53.5368 10.2539 53.6719C7.63672 53.7501 5.01953 53.7501 2.40234 53.6719C1.17943 53.5217 0.359127 52.8771 -0.0585938 51.7383C-0.0585938 44.2773 -0.0585938 36.8165 -0.0585938 29.3555C0.271464 28.4592 0.896463 27.8537 1.81641 27.5391C4.82422 27.4609 7.83203 27.4609 10.8398 27.5391C11.6653 27.7862 12.2317 28.3136 12.5391 29.1211C12.7043 30.1271 12.7629 31.1426 12.7148 32.168C15.3032 31.4526 17.9203 30.8666 20.5664 30.4102C24.9432 31.3158 29.2597 32.4487 33.5156 33.8086C35.7618 32.4219 38.0078 31.0351 40.2539 29.6485C41.8945 28.7891 43.5352 28.7891 45.1758 29.6485C45.5426 29.8978 45.8746 30.1908 46.1719 30.5274C46.885 30.1023 47.6077 29.6922 48.3398 29.2969C50.4326 28.5821 52.2294 29.0312 53.7305 30.6446C56.7818 29.8068 58.852 30.8615 59.9414 33.8086ZM2.28516 29.5899C4.94169 29.5703 7.59795 29.5899 10.2539 29.6485C10.3516 29.7461 10.4492 29.8438 10.5469 29.9414C10.625 37.0117 10.625 44.0821 10.5469 51.1524C10.4883 51.2891 10.3906 51.3867 10.2539 51.4453C7.59765 51.5235 4.94141 51.5235 2.28516 51.4453C2.22656 51.3867 2.16797 51.3282 2.10938 51.2696C2.03125 44.1211 2.03125 36.9727 2.10938 29.8242C2.19342 29.7605 2.25202 29.6823 2.28516 29.5899ZM42.1289 31.1133C42.9079 31.0069 43.611 31.1827 44.2383 31.6407C43.2123 32.2414 42.2162 32.8859 41.25 33.5742C41.006 34.9063 41.5334 35.3946 42.832 35.0391C44.9414 33.7891 47.0508 32.5391 49.1602 31.2891C50.1139 30.9544 50.9734 31.1107 51.7383 31.7578C49.262 33.1994 46.8011 34.6642 44.3555 36.1524C43.8108 36.8887 43.928 37.4942 44.707 37.9688C45.2237 38.0631 45.6925 37.9459 46.1133 37.6172C49.0261 35.7973 51.9949 34.0785 55.0195 32.461C56.3647 32.3235 57.2827 32.8899 57.7734 34.1602C57.9151 34.9085 57.7979 35.6117 57.4219 36.2696C51.1106 40.9594 44.5677 45.3149 37.793 49.336C36.4053 50.1079 34.9601 50.7524 33.457 51.2696C26.5447 50.1253 19.6697 48.7777 12.832 47.2266C12.7153 42.9578 12.6762 38.6805 12.7148 34.3946C15.3083 33.6778 17.9255 33.0529 20.5664 32.5196C26.6161 33.9698 32.5927 35.669 38.4961 37.6172C40.4057 38.6188 40.8158 40.0446 39.7266 41.8946C38.823 42.7767 37.7488 43.0697 36.5039 42.7735C33.0853 42.3681 29.6673 41.958 26.25 41.543C25.0328 41.6053 24.6812 42.1913 25.1953 43.3008C25.3884 43.4434 25.6032 43.541 25.8398 43.5938C29.7607 44.1253 33.6865 44.6137 37.6172 45.0586C41.0047 44.6397 42.6063 42.7257 42.4219 39.3164C41.9798 37.4676 40.8666 36.1981 39.082 35.5078C38.1724 35.2125 37.2739 34.9 36.3867 34.5703C38.2732 33.3545 40.1872 32.2021 42.1289 31.1133Z"
                , SvgAttr.fill "currentColor"
                , SvgAttr.stroke "currentColor"
                , SvgAttr.strokeWidth "0.5"
                ]
                []
            , path
                [ SvgAttr.opacity "0.94"
                , SvgAttr.fillRule "evenodd"
                , SvgAttr.clipRule "evenodd"
                , SvgAttr.d "M32.9882 6.15234C34.5976 6.17382 36.121 6.54492 37.5585 7.26562C38.3057 7.72745 38.4619 8.35245 38.0273 9.14062C37.7914 9.28795 37.5376 9.38561 37.2656 9.43359C36.3383 9.01888 35.3812 8.68685 34.3945 8.4375C31.1291 8.05861 28.6681 9.26955 27.0117 12.0703C29.5898 12.1093 32.1679 12.1485 34.746 12.1875C35.5831 12.5902 35.7589 13.1957 35.2734 14.0039C35.1855 14.0773 35.0878 14.1359 34.9804 14.1797C32.0891 14.1993 29.1984 14.2579 26.3085 14.3555C26.1775 14.9742 26.1581 15.5992 26.25 16.2305C29.1336 16.4436 32.0438 16.5414 34.9804 16.5234C35.5623 16.9316 35.6989 17.4589 35.3906 18.1055C35.236 18.3383 35.0212 18.4751 34.746 18.5156C32.1679 18.5546 29.5898 18.5938 27.0117 18.6328C28.8407 21.6564 31.497 22.8282 34.9804 22.1484C35.763 21.9034 36.5247 21.6104 37.2656 21.2695C38.1774 21.4509 38.49 21.9979 38.2031 22.9102C37.4058 23.592 36.4878 24.0411 35.4492 24.2578C31.0303 25.0846 27.6124 23.6197 25.1953 19.8633C24.9874 19.4865 24.8116 19.0959 24.6679 18.6914C24.1645 18.5944 23.6567 18.5358 23.1445 18.5156C22.3567 18.1644 22.1614 17.598 22.5585 16.8164C22.6757 16.7188 22.7929 16.6211 22.9101 16.5234C23.2988 16.4651 23.6894 16.4455 24.082 16.4648C24.082 15.7227 24.082 14.9804 24.082 14.2383C22.6783 14.4953 22.151 13.9484 22.5 12.5977C22.5976 12.5 22.6953 12.4023 22.7929 12.3047C23.4125 12.1862 24.0376 12.0886 24.6679 12.0117C26.2818 8.40469 29.0553 6.45157 32.9882 6.15234Z"
                , SvgAttr.fill "currentColor"
                , SvgAttr.stroke "currentColor"
                , SvgAttr.strokeWidth "0.5"
                ]
                []
            ]
        , Svg.defs []
            [ Svg.clipPath
                [ SvgAttr.id "clip0_3896_183447"
                ]
                [ Svg.rect
                    [ SvgAttr.width "60"
                    , SvgAttr.height "60"
                    , SvgAttr.fill "currentColor"
                    ]
                    []
                ]
            ]
        ]


familyIcon : Svg msg
familyIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ path
            [ SvgAttr.opacity "0.975"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M15.3516 5C16.2305 5 17.1094 5 17.9883 5C22.0135 5.88406 24.4061 8.35802 25.166 12.4219C25.4682 15.6076 24.4103 18.228 21.9922 20.2832C23.2266 20.9962 24.3496 21.8589 25.3613 22.8711C26.1023 23.8005 26.7696 24.7771 27.3633 25.8008C28.2159 25.5038 29.0948 25.341 30 25.3125C30.9362 25.3667 31.8478 25.5132 32.7344 25.752C33.8956 23.3537 35.6534 21.5308 38.0078 20.2832C34.9085 17.5056 34.0459 14.1364 35.4199 10.1758C36.7468 7.33451 38.944 5.60925 42.0117 5C42.8906 5 43.7695 5 44.6484 5C49.7062 6.26894 52.0987 9.52415 51.8262 14.7656C51.4842 17.0299 50.4262 18.869 48.6523 20.2832C52.1728 22.2615 54.2886 25.24 55 29.2188C55 37.5195 55 45.8203 55 54.1211C54.8727 54.2663 54.7588 54.4291 54.6582 54.6094C54.4614 54.7263 54.2823 54.8564 54.1211 55C38.0403 55 21.9597 55 5.87891 55C5.7337 54.8727 5.57094 54.7588 5.39062 54.6582C5.27377 54.4614 5.14356 54.2823 5 54.1211C5 45.8203 5 37.5195 5 29.2188C5.71138 25.24 7.82727 22.2615 11.3477 20.2832C8.28932 17.5835 7.39414 14.2794 8.66211 10.3711C9.97973 7.42771 12.2096 5.63734 15.3516 5ZM16.6211 7.92969C20.0324 8.26481 21.8879 10.1366 22.1875 13.5449C22.0107 16.34 20.5784 18.1304 17.8906 18.916C14.3867 19.3507 12.1569 17.8695 11.2012 14.4727C11.0339 10.6345 12.8405 8.45351 16.6211 7.92969ZM43.2812 7.92969C46.6908 8.26306 48.5463 10.1348 48.8477 13.5449C48.6937 16.3037 47.2938 18.0941 44.6484 18.916C41.1838 19.3815 38.9377 17.9492 37.9102 14.6191C37.5463 11.7004 38.6855 9.61702 41.3281 8.36914C41.9722 8.12739 42.6232 7.98091 43.2812 7.92969ZM15.8398 22.0898C19.9184 21.9958 22.848 23.7699 24.6289 27.4121C22.1664 30.0572 21.5967 33.0683 22.9199 36.4453C23.4352 37.5462 24.1676 38.4739 25.1172 39.2285C22.479 40.9393 20.9979 43.3645 20.6738 46.5039C20.625 48.3591 20.6087 50.2146 20.625 52.0703C16.3933 52.0703 12.1615 52.0703 7.92969 52.0703C7.91341 44.9739 7.92969 37.8775 7.97852 30.7812C8.15549 27.0908 9.89702 24.4378 13.2031 22.8223C14.0647 22.4688 14.9437 22.2247 15.8398 22.0898ZM42.5977 22.0898C47.191 22.0654 50.2347 24.2139 51.7285 28.5352C51.9055 29.2732 52.0031 30.0219 52.0215 30.7812C52.0703 37.8775 52.0866 44.9739 52.0703 52.0703C47.8386 52.0703 43.6067 52.0703 39.375 52.0703C39.3913 50.2146 39.375 48.3591 39.3262 46.5039C39.0021 43.3645 37.521 40.9393 34.8828 39.2285C37.6064 36.7824 38.4039 33.8039 37.2754 30.293C36.822 29.2054 36.1872 28.2451 35.3711 27.4121C36.8229 24.3272 39.2317 22.5532 42.5977 22.0898ZM29.707 28.3398C32.7294 28.5303 34.4221 30.1254 34.7852 33.125C34.6618 35.1144 33.7178 36.5629 31.9531 37.4707C29.1995 38.3867 27.0999 37.5892 25.6543 35.0781C24.8049 32.6976 25.3746 30.7281 27.3633 29.1699C28.0988 28.7242 28.8801 28.4476 29.707 28.3398ZM29.1211 40.9375C32.1932 40.7557 34.4229 42.0252 35.8105 44.7461C36.0497 45.3447 36.2125 45.9632 36.2988 46.6016C36.3477 48.4242 36.364 50.2471 36.3477 52.0703C32.1159 52.0703 27.8841 52.0703 23.6523 52.0703C23.636 50.2471 23.6523 48.4242 23.7012 46.6016C24.2663 43.5139 26.0729 41.6259 29.1211 40.9375Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        ]


homeIcon : Svg msg
homeIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ path
            [ SvgAttr.opacity "0.969"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M28.6846 5.05737C29.5957 5.05737 30.5069 5.05737 31.418 5.05737C31.9935 5.31293 32.5467 5.62207 33.0776 5.98479C40.0576 12.9648 47.0376 19.9448 54.0176 26.9248C54.3804 27.4557 54.6895 28.0089 54.9451 28.5844C54.9451 29.4955 54.9451 30.4068 54.9451 31.3179C54.0137 33.624 52.289 34.7304 49.7711 34.637C49.7874 39.681 49.7711 44.7248 49.7222 49.7686C49.4605 52.5358 47.9799 54.2442 45.2804 54.8937C42.124 54.9589 38.9674 54.9589 35.811 54.8937C35.3743 54.7172 35.0651 54.4082 34.8836 53.9663C34.8511 49.8011 34.8185 45.6359 34.786 41.4706C34.6266 40.3352 33.992 39.6356 32.8823 39.3717C30.995 39.3066 29.1076 39.3066 27.2202 39.3717C26.1523 39.6261 25.5178 40.2932 25.3166 41.373C25.2841 45.5708 25.2515 49.7686 25.219 53.9663C25.04 54.4056 24.7308 54.7148 24.2915 54.8937C21.1025 54.9589 17.9136 54.9589 14.7245 54.8937C12.169 54.2256 10.7209 52.5822 10.3803 49.9638C10.3315 44.855 10.3152 39.746 10.3315 34.637C7.1211 34.6796 5.36389 33.1176 5.05988 29.9512C5.01689 28.9903 5.26094 28.1117 5.79205 27.3153C12.8345 20.1753 19.9121 13.0651 27.025 5.98479C27.5559 5.62207 28.1091 5.31293 28.6846 5.05737ZM29.5632 7.98605C30.1305 7.91521 30.6512 8.02909 31.1251 8.32773C37.975 15.1776 44.8248 22.0274 51.6747 28.8773C52.042 29.4588 52.1071 30.0771 51.8699 30.7321C51.5727 31.1658 51.166 31.4424 50.6497 31.5619C49.6734 31.5944 48.6972 31.627 47.721 31.6595C47.2817 31.8385 46.9725 32.1477 46.7936 32.587C46.7611 38.3142 46.7284 44.0413 46.6959 49.7686C46.5595 50.8165 45.99 51.5162 44.9875 51.8674C42.6154 52.0069 40.24 52.0558 37.8611 52.0139C37.8774 48.4342 37.8611 44.8547 37.8123 41.2754C37.4375 38.5252 35.8918 36.882 33.1752 36.3454C31.06 36.2803 28.9449 36.2803 26.8297 36.3454C24.2546 36.9031 22.7415 38.4812 22.2903 41.0801C22.2415 44.7246 22.2252 48.3691 22.2415 52.0139C19.8626 52.0558 17.4871 52.0069 15.115 51.8674C14.1125 51.5162 13.5431 50.8165 13.4066 49.7686C13.3741 44.0413 13.3415 38.3142 13.309 32.587C13.13 32.1477 12.8209 31.8385 12.3816 31.6595C11.4054 31.627 10.4291 31.5944 9.4529 31.5619C8.38051 31.2689 7.94121 30.5692 8.135 29.463C8.18977 29.2458 8.2874 29.0506 8.42787 28.8773C15.2778 22.0274 22.1275 15.1776 28.9774 8.32773C29.166 8.18535 29.3613 8.07145 29.5632 7.98605Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        ]


languageIcon : Svg msg
languageIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ path
            [ SvgAttr.opacity "0.961"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M7.44144 7.44141C15.7619 7.42187 24.0822 7.44141 32.4024 7.5C35.0771 8.14349 36.7373 9.80365 37.3829 12.4805C37.4414 15.5661 37.461 18.6522 37.4414 21.7383C42.2462 21.7187 47.0509 21.7383 51.8555 21.7969C54.9338 22.297 56.7893 24.0744 57.4219 27.1289C57.5364 32.9536 57.4973 38.7739 57.3047 44.5898C56.378 47.5446 54.3662 49.1462 51.2696 49.3945C51.289 50.4109 51.2696 51.4266 51.211 52.4414C50.7162 54.0274 49.6419 54.672 47.9883 54.375C47.7013 54.29 47.4278 54.1729 47.168 54.0234C45.6446 52.5 44.1211 50.9766 42.5977 49.4531C37.7148 49.4141 32.8321 49.375 27.9493 49.3359C25.2766 48.8898 23.4992 47.3858 22.6172 44.8242C22.4465 41.5479 22.3879 38.2666 22.4414 34.9805C20.3707 34.9609 18.3005 34.9805 16.2305 35.0391C15.1901 36.4753 14.1354 37.901 13.0664 39.3164C11.5519 40.503 10.1847 40.3467 8.96488 38.8477C8.81349 38.5937 8.71582 38.3203 8.67191 38.0273C8.61334 37.0125 8.59382 35.9968 8.61332 34.9805C5.28206 34.7156 3.23128 32.9578 2.46097 29.707C2.34652 23.8433 2.38558 17.9839 2.57816 12.1289C3.30329 9.62628 4.92438 8.06377 7.44144 7.44141ZM7.91019 10.0195C15.9181 10 23.9259 10.0195 31.9336 10.0781C33.4375 10.4883 34.3946 11.4453 34.8047 12.9492C34.8633 15.8787 34.8829 18.8084 34.8633 21.7383C32.5974 21.7187 30.3317 21.7383 28.0664 21.7969C26.9724 21.9141 25.9763 22.2851 25.0782 22.9102C23.7055 20.0434 22.3775 17.1527 21.0938 14.2383C20.4978 13.5802 19.8142 13.4825 19.043 13.9453C16.7692 18.6946 14.5622 23.4798 12.4219 28.3008C12.4171 29.7404 13.1007 30.2288 14.4727 29.7656C14.5703 29.668 14.668 29.5703 14.7657 29.4727C15.4662 28.0131 16.1499 26.5482 16.8164 25.0781C18.9269 24.9805 21.0362 25.0001 23.1446 25.1367C22.8045 25.6765 22.5897 26.2624 22.5 26.8945C22.4414 28.73 22.4219 30.566 22.4414 32.4023C19.9802 32.3828 17.5192 32.4023 15.0586 32.4609C14.8097 32.5924 14.5949 32.7682 14.4141 32.9883C13.3594 34.4336 12.3047 35.8789 11.25 37.3242C11.2456 35.8287 11.1674 34.3444 11.0157 32.8711C10.8306 32.6905 10.6157 32.5538 10.3711 32.4609C8.46834 32.7389 6.88631 32.1725 5.62504 30.7617C5.31331 30.2562 5.11799 29.7093 5.0391 29.1211C4.96097 23.8086 4.96097 18.4961 5.0391 13.1836C5.37093 11.5439 6.32796 10.4892 7.91019 10.0195ZM19.8633 18.2227C20.5919 19.5432 21.2559 20.9104 21.8555 22.3242C20.5682 22.4609 19.2791 22.4803 17.9883 22.3828C18.6298 21.0023 19.2548 19.6155 19.8633 18.2227ZM28.6524 24.3164C36.1915 24.2968 43.7307 24.3164 51.2696 24.375C53.2417 24.5896 54.433 25.6637 54.8438 27.5977C54.958 33.1099 54.919 38.6177 54.7266 44.1211C54.2695 45.3986 53.3905 46.2384 52.0899 46.6406C51.1956 46.7625 50.2971 46.8405 49.3946 46.875C49.1853 46.967 49.0095 47.1036 48.8672 47.2852C48.7155 48.7584 48.6373 50.2427 48.6329 51.7383C47.0084 50.0747 45.3482 48.4536 43.6524 46.875C38.6523 46.836 33.6524 46.7968 28.6524 46.7578C26.7869 46.5723 25.5955 45.5762 25.0782 43.7695C25 38.3007 25 32.8321 25.0782 27.3633C25.615 25.5554 26.8064 24.5398 28.6524 24.3164Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.951"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M39.5508 27.3633C40.217 27.2921 40.7443 27.5265 41.1328 28.0664C41.1914 29.0812 41.2108 30.0969 41.1914 31.1133C42.9887 31.0937 44.7855 31.1133 46.582 31.1718C47.7347 31.8792 47.8128 32.6995 46.8164 33.6328C46.3884 33.6913 45.9588 33.7107 45.5273 33.6914C45.2441 36.3083 44.1894 38.5543 42.3633 40.4297C42.7635 40.6543 43.1931 40.8105 43.6523 40.8984C44.5651 40.9918 45.4636 41.148 46.3476 41.3672C47.0703 42.0317 47.1094 42.7349 46.4648 43.4765C46.1478 43.6959 45.7963 43.7935 45.4101 43.7695C43.4837 43.6983 41.6867 43.1904 40.0195 42.2461C38.1246 43.3086 36.0934 43.7968 33.9258 43.7109C33.086 43.3788 32.793 42.7733 33.0469 41.8945C33.1388 41.6852 33.2755 41.5094 33.457 41.3672C34.3802 41.1467 35.3177 40.9904 36.2695 40.8984C36.7196 40.7958 37.1492 40.6395 37.5586 40.4297C36.4479 39.3791 35.6667 38.1291 35.2148 36.6797C35.458 35.4664 36.1611 35.1149 37.3242 35.625C37.8078 36.4558 38.3352 37.2567 38.9062 38.0273C39.2205 38.3613 39.5526 38.6737 39.9023 38.9648C41.5316 37.603 42.5472 35.8647 42.9492 33.75C39.6679 33.7109 36.3867 33.6718 33.1054 33.6328C32.4851 33.2302 32.2703 32.6639 32.4609 31.9336C32.6441 31.5553 32.9371 31.3013 33.3398 31.1718C35.0972 31.1133 36.855 31.0937 38.6133 31.1133C38.5938 30.1749 38.6133 29.2374 38.6719 28.3008C38.8304 27.8496 39.1234 27.537 39.5508 27.3633Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        ]


paperworkIcon : Svg msg
paperworkIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ path
            [ SvgAttr.opacity "0.984"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M15.1225 4.26587C23.6 4.26587 32.0775 4.26587 40.555 4.26587C44.1034 7.73054 47.605 11.2489 51.0597 14.8209C51.1268 26.3811 51.1268 37.9413 51.0597 49.5015C50.7414 50.6241 50.021 51.3444 48.8985 51.6628C48.2962 51.713 47.6931 51.7298 47.089 51.7131C47.3912 53.6572 46.6541 54.9976 44.8775 55.734C33.6189 55.734 22.3602 55.734 11.1015 55.734C9.99746 55.3838 9.27704 54.6465 8.94028 53.5225C8.87326 39.1811 8.87326 24.8398 8.94028 10.4983C9.25861 9.37582 9.97902 8.65541 11.1015 8.33708C11.7038 8.28687 12.3069 8.27011 12.911 8.28682C12.6087 6.34264 13.3459 5.00232 15.1225 4.26587ZM15.9267 6.27634C23.6335 6.27634 31.3403 6.27634 39.0471 6.27634C39.0304 8.89017 39.0471 11.5038 39.0974 14.1172C39.4158 15.2397 40.1361 15.9601 41.2587 16.2785C43.8721 16.3287 46.4857 16.3455 49.0995 16.3287C49.1163 27.1183 49.0995 37.9078 49.0493 48.6974C48.9655 49.2502 48.6472 49.5686 48.0943 49.6523C37.3717 49.7194 26.6492 49.7194 15.9267 49.6523C15.5308 49.6308 15.2459 49.4466 15.0722 49.0994C15.0388 40.8565 15.0052 32.6136 14.9717 24.3706C14.8185 23.4832 14.2991 23.1649 13.4136 23.4156C13.2293 23.5329 13.0785 23.6837 12.9612 23.868C12.8942 32.4125 12.8942 40.957 12.9612 49.5015C13.2796 50.6241 14 51.3444 15.1225 51.6628C25.1078 51.7131 35.0931 51.7299 45.0786 51.7131C45.1012 52.1904 45.0509 52.6595 44.9278 53.1204C44.7216 53.4273 44.4367 53.6116 44.0733 53.6733C33.3508 53.7403 22.6283 53.7403 11.9057 53.6733C11.3193 53.623 11.001 53.3047 10.9508 52.7183C10.8837 38.9131 10.8837 25.1078 10.9508 11.3025C11.001 10.7161 11.3193 10.3978 11.9057 10.3476C12.2391 10.2975 12.5742 10.2807 12.911 10.2973C12.8942 12.1405 12.911 13.9835 12.9612 15.8261C13.3287 16.3061 13.8145 16.4569 14.4188 16.2785C14.7725 16.0587 14.9568 15.7404 14.9717 15.3235C15.0052 12.5088 15.0388 9.69415 15.0722 6.87949C15.2675 6.53992 15.5523 6.33887 15.9267 6.27634ZM41.0576 7.88472C43.2154 9.9922 45.3599 12.12 47.4911 14.268C45.6817 14.335 43.8723 14.335 42.0629 14.268C41.4765 14.2177 41.1581 13.8994 41.1079 13.313C41.0576 11.5039 41.0408 9.69446 41.0576 7.88472Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.943"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.4955 9.34271C22.4443 9.32596 25.393 9.34271 28.3414 9.39297C28.9052 9.72236 29.0895 10.2082 28.8942 10.8505C28.7685 11.1401 28.5508 11.3244 28.2409 11.4034C25.3592 11.4704 22.4777 11.4704 19.596 11.4034C19.0884 11.2593 18.8539 10.9242 18.8924 10.3982C18.8747 9.91335 19.0757 9.56153 19.4955 9.34271Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.991"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.3954 14.268C25.0917 14.2512 30.7878 14.268 36.484 14.3183C36.964 14.6857 37.1147 15.1715 36.9363 15.7758C36.819 15.9601 36.6682 16.1109 36.484 16.2282C30.7877 16.2952 25.0916 16.2952 19.3954 16.2282C18.9154 15.8608 18.7646 15.3749 18.943 14.7706C19.0803 14.5834 19.2311 14.416 19.3954 14.268Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.908"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M13.364 18.7922C14.5525 18.6237 15.0384 19.1264 14.8215 20.3C14.4541 20.78 13.9682 20.9308 13.364 20.7524C12.884 20.385 12.7332 19.8992 12.9116 19.2948C13.0489 19.1077 13.1997 18.9402 13.364 18.7922Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.947"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.4955 24.0187C25.1248 24.002 30.754 24.0187 36.3831 24.069C36.8155 24.2635 37.0166 24.5986 36.9862 25.0742C37.0247 25.6002 36.7902 25.9353 36.2826 26.0794C30.7204 26.1465 25.1582 26.1465 19.596 26.0794C19.0884 25.9353 18.8539 25.6002 18.8924 25.0742C18.8747 24.5894 19.0757 24.2376 19.4955 24.0187Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.984"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.3954 28.9438C22.4112 28.927 25.4268 28.9438 28.4423 28.9941C28.9223 29.3615 29.073 29.8473 28.8946 30.4516C28.7773 30.6359 28.6265 30.7867 28.4423 30.904C25.4266 30.971 22.411 30.971 19.3954 30.904C18.9154 30.5366 18.7646 30.0507 18.943 29.4464C19.0803 29.2592 19.2311 29.0918 19.3954 28.9438Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.943"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.5962 33.769C22.478 33.7522 25.3595 33.769 28.241 33.8193C28.8997 34.0937 29.1175 34.5795 28.8944 35.2768C28.7771 35.5281 28.5928 35.7124 28.3415 35.8297C25.3929 35.8967 22.4442 35.8967 19.4956 35.8297C19.0632 35.6352 18.8622 35.3001 18.8925 34.8245C18.8716 34.294 19.1061 33.9422 19.5962 33.769Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.946"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.4955 38.6943C24.3877 38.6775 29.2796 38.6943 34.1716 38.7445C34.6041 38.9391 34.8051 39.2741 34.7747 39.7498C34.8132 40.2758 34.5787 40.6108 34.0711 40.755C29.2461 40.822 24.421 40.822 19.596 40.755C19.0884 40.6108 18.8539 40.2758 18.8924 39.7498C18.8747 39.2649 19.0757 38.9131 19.4955 38.6943Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        , path
            [ SvgAttr.opacity "0.988"
            , SvgAttr.fillRule "evenodd"
            , SvgAttr.clipRule "evenodd"
            , SvgAttr.d "M19.3954 43.6213C24.053 43.6045 28.7105 43.6213 33.3678 43.6715C34.0075 44.1078 34.1248 44.6607 33.7196 45.3301C33.6289 45.4509 33.5117 45.5347 33.3678 45.5815C28.7104 45.6485 24.0528 45.6485 19.3954 45.5815C18.9154 45.214 18.7646 44.7282 18.943 44.1239C19.0803 43.9367 19.2311 43.7693 19.3954 43.6213Z"
            , SvgAttr.fill "currentColor"
            ]
            []
        ]


carIcon : Svg msg
carIcon =
    svg
        [ SvgAttr.width "60"
        , SvgAttr.height "60"
        , SvgAttr.viewBox "0 0 60 60"
        , SvgAttr.fill "none"
        ]
        [ Svg.g
            [ SvgAttr.clipPath "url(#clip0_3896_183459)"
            ]
            [ path
                [ SvgAttr.opacity "0.978"
                , SvgAttr.fillRule "evenodd"
                , SvgAttr.clipRule "evenodd"
                , SvgAttr.d "M59.9414 34.1602C59.9414 37.6758 59.9414 41.1914 59.9414 44.7071C59.7287 45.1734 59.3771 45.5053 58.8867 45.7032C57.2447 45.7227 55.6041 45.7813 53.9648 45.8789C52.7337 50.2749 49.8431 52.5796 45.293 52.793C40.7428 52.5796 37.8523 50.2749 36.6211 45.8789C32.168 45.7227 27.7148 45.7227 23.2617 45.8789C21.7569 50.8709 18.3975 53.156 13.1836 52.7344C9.3788 51.918 6.95692 49.6328 5.91797 45.8789C4.27874 45.7813 2.63811 45.7227 0.996094 45.7032C0.505642 45.5053 0.154079 45.1734 -0.0585938 44.7071C-0.0585938 40.7227 -0.0585938 36.7383 -0.0585938 32.7539C0.525782 30.2419 1.97109 28.3865 4.27734 27.1875C5.31445 26.8158 6.34961 26.4448 7.38281 26.0742C8.37272 23.4694 9.42741 20.8913 10.5469 18.3399C11.9951 16.0728 14.0459 14.6861 16.6992 14.1797C23.2617 14.1016 29.8242 14.1016 36.3867 14.1797C38.0554 14.5063 39.5398 15.2094 40.8398 16.2891C43.4845 19.4217 46.0627 22.6054 48.5742 25.8399C50.4864 26.3201 52.4004 26.8084 54.3164 27.3047C57.4232 28.5938 59.2982 30.8789 59.9414 34.1602ZM18.1055 17.6367C20.7226 17.6367 23.3399 17.6367 25.957 17.6367C25.957 20.3711 25.957 23.1055 25.957 25.8399C21.1126 25.8789 16.2689 25.8399 11.4258 25.7227C12.0818 24.1258 12.7263 22.5243 13.3594 20.918C14.3154 18.9076 15.8974 17.8138 18.1055 17.6367ZM29.4727 17.6367C31.27 17.6172 33.0668 17.6367 34.8633 17.6953C36.6137 17.7796 38.0395 18.5022 39.1406 19.8633C40.7086 21.8467 42.2906 23.8193 43.8867 25.7813C39.0821 25.8399 34.2775 25.8594 29.4727 25.8399C29.4727 23.1055 29.4727 20.3711 29.4727 17.6367ZM9.08203 29.3555C21.8556 29.3359 34.629 29.3555 47.4023 29.4141C49.3744 29.8095 51.3274 30.2782 53.2617 30.8203C55.2355 31.7801 56.2706 33.3621 56.3672 35.5664C56.4258 37.7926 56.4454 40.0192 56.4258 42.2461C55.6017 42.2848 54.7814 42.2458 53.9648 42.1289C52.7337 37.733 49.8431 35.4283 45.293 35.2149C40.7428 35.4283 37.8523 37.733 36.6211 42.1289C32.168 42.2851 27.7148 42.2851 23.2617 42.1289C22.0305 37.733 19.14 35.4283 14.5898 35.2149C10.0397 35.4283 7.14911 37.733 5.91797 42.1289C5.10136 42.2458 4.28105 42.2848 3.45703 42.2461C3.43751 39.5506 3.45703 36.8553 3.51562 34.1602C3.56723 32.6697 4.21177 31.5174 5.44922 30.7032C6.6672 30.239 7.87813 29.7898 9.08203 29.3555ZM13.5352 38.8477C16.7041 38.5626 18.7549 39.9297 19.6875 42.9492C20.0297 46.1208 18.682 48.1716 15.6445 49.1016C12.473 49.4438 10.4222 48.0961 9.49219 45.0586C9.17423 41.8841 10.5219 39.8138 13.5352 38.8477ZM44.2383 38.8477C47.4073 38.5626 49.458 39.9297 50.3906 42.9492C50.7328 46.1208 49.3852 48.1716 46.3477 49.1016C43.1761 49.4438 41.1253 48.0961 40.1953 45.0586C39.8774 41.8841 41.225 39.8138 44.2383 38.8477Z"
                , SvgAttr.fill "currentColor"
                ]
                []
            , path
                [ SvgAttr.opacity "0.977"
                , SvgAttr.fillRule "evenodd"
                , SvgAttr.clipRule "evenodd"
                , SvgAttr.d "M-0.0585938 9.55078C-0.0585938 9.08203 -0.0585938 8.61328 -0.0585938 8.14453C0.154079 7.67827 0.505642 7.34623 0.996094 7.14844C3.41797 7.07031 5.83984 7.07031 8.26172 7.14844C9.31344 7.75216 9.60641 8.63106 9.14062 9.78516C8.93381 10.1336 8.64084 10.3875 8.26172 10.5469C5.83984 10.625 3.41797 10.625 0.996094 10.5469C0.505642 10.3491 0.154079 10.017 -0.0585938 9.55078Z"
                , SvgAttr.fill "currentColor"
                ]
                []
            , path
                [ SvgAttr.opacity "0.961"
                , SvgAttr.fillRule "evenodd"
                , SvgAttr.clipRule "evenodd"
                , SvgAttr.d "M12.7149 7.08991C14.055 7.03649 15.3831 7.09508 16.6993 7.26569C17.0477 7.4725 17.3016 7.76547 17.461 8.1446C17.783 9.23668 17.451 10.0375 16.4649 10.5469C15.1253 10.6589 13.7972 10.6198 12.4805 10.4298C11.8838 10.0762 11.6103 9.54889 11.6602 8.84772C11.677 8.05194 12.0285 7.466 12.7149 7.08991Z"
                , SvgAttr.fill "currentColor"
                ]
                []
            , path
                [ SvgAttr.opacity "0.973"
                , SvgAttr.fillRule "evenodd"
                , SvgAttr.clipRule "evenodd"
                , SvgAttr.d "M-0.0585938 16.5821C-0.0585938 16.1133 -0.0585938 15.6446 -0.0585938 15.1758C0.154079 14.7095 0.505642 14.3775 0.996094 14.1797C3.02734 14.1016 5.0586 14.1016 7.08984 14.1797C8.14157 14.7835 8.43454 15.6624 7.96875 16.8164C7.76194 17.1648 7.46897 17.4188 7.08984 17.5782C5.0586 17.6563 3.02734 17.6563 0.996094 17.5782C0.505642 17.3803 0.154079 17.0483 -0.0585938 16.5821Z"
                , SvgAttr.fill "currentColor"
                ]
                []
            ]
        , Svg.defs []
            [ Svg.clipPath
                [ SvgAttr.id "clip0_3896_183459"
                ]
                [ Svg.rect
                    [ SvgAttr.width "60"
                    , SvgAttr.height "60"
                    , SvgAttr.fill "currentColor"
                    ]
                    []
                ]
            ]
        ]